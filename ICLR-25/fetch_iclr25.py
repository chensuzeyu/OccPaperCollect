#!/usr/bin/env python3
"""
ICLR 2025 - Occupancy 相关论文爬取脚本
通过 OpenReview API 获取 poster / spotlight / oral 录用论文，按关键词过滤 occupancy 相关
关键词: occupancy, semantic scene completion, scene completion, panoptic scene completion
"""
import json
import re
import os
from pathlib import Path

try:
    import openreview
except ImportError:
    print("请先安装: pip install openreview-py")
    exit(1)

# 关键词列表（不区分大小写）
KEYWORDS = [
    "occupancy",
    "semantic scene completion",
    "scene completion",
    "panoptic scene completion",
]

# ICLR 2025 录用 venue 标签（对应 content.venue，注意大小写）
ACCEPTED_VENUES = [
    ("ICLR 2025 Poster", "poster"),
    ("ICLR 2025 Spotlight", "spotlight"),
    ("ICLR 2025 Oral", "oral"),
]
SUBMISSION_INVITATION = "ICLR.cc/2025/Conference/-/Submission"


def normalize(name):
    """将作者名转为安全的文件夹名"""
    return re.sub(r"[^\w\-]", "", name.replace(" ", ""))


# 明显不相关（RL occupancy measure 等），用于排除误匹配
EXCLUDE_PATTERNS = [
    "policy gradient", "bandit feedback", "capable model",
    "reward hacking", "occupancy measures",  # RL 中的 occupancy measure
]


def matches_keywords(text):
    """检查文本是否包含任一关键词（3D/场景相关 occupancy）"""
    if not text:
        return False
    t = text.lower()
    if any(p in t for p in EXCLUDE_PATTERNS):
        return False
    if "occupancy" in t:
        return True
    if "semantic scene completion" in t or "panoptic scene completion" in t:
        return True
    if "scene completion" in t:
        return True
    return False


def extract_first_author(authors):
    """从作者列表提取第一作者姓"""
    if not authors:
        return "Unknown"
    first = authors[0]
    if isinstance(first, str):
        parts = first.replace("~", "").replace("_", " ").strip().split()
        return parts[-1] if parts else first
    if isinstance(first, dict) and "name" in first:
        parts = first["name"].replace("~", "").strip().split()
        return parts[-1] if parts else "Unknown"
    return "Unknown"


def main():
    base_dir = Path(__file__).resolve().parent
    papers_dir = base_dir / "papers"
    papers_dir.mkdir(exist_ok=True)

    client = openreview.api.OpenReviewClient(
        baseurl="https://api2.openreview.net"
    )

    all_accepted = []
    seen_forums = set()

    for venue_label, pres_type in ACCEPTED_VENUES:
        try:
            notes = list(client.get_all_notes(
                invitation=SUBMISSION_INVITATION,
                content={"venue": venue_label},
            ))
            print(f"[{venue_label}] 获取到 {len(notes)} 篇")
            for n in notes:
                if n.forum in seen_forums:
                    continue
                seen_forums.add(n.forum)
                all_accepted.append((n, pres_type))
        except Exception as e:
            print(f"[{venue_label}] 错误: {e}")

    print(f"\n去重后录用论文总数: {len(all_accepted)}")

    # 过滤 occupancy 相关
    filtered = []
    for note, pres_type in all_accepted:
        title = note.content.get("title", {})
        if isinstance(title, dict):
            title = title.get("value", "")
        abstract = note.content.get("abstract", {})
        if isinstance(abstract, dict):
            abstract = abstract.get("value", "")
        keywords = note.content.get("keywords", {})
        if isinstance(keywords, dict):
            keywords = keywords.get("value", "")
        elif isinstance(keywords, list):
            keywords = " ".join(str(k) for k in keywords)

        text = f"{title} {abstract} {keywords}"
        if matches_keywords(text):
            filtered.append((note, pres_type))

    print(f"匹配 Occupancy/Scene Completion 关键词: {len(filtered)} 篇\n")

    results = []
    for i, (note, pres_type) in enumerate(filtered, 1):
        title = note.content.get("title", {})
        if isinstance(title, dict):
            title = title.get("value", "")
        authors_raw = note.content.get("authors", {})
        if isinstance(authors_raw, dict):
            authors_raw = authors_raw.get("value", [])
        first_author = extract_first_author(authors_raw)
        short_title = title.split(":")[0].strip() if ":" in title else title[:30]
        short_title = re.sub(r"[^\w\s\-]", "", short_title).strip()[:40]

        dir_name = f"{short_title}_{first_author}"
        dir_name = re.sub(r"\s+", "", dir_name)
        paper_dir = papers_dir / dir_name
        paper_dir.mkdir(exist_ok=True)

        pdf_url = note.content.get("pdf", {})
        if isinstance(pdf_url, dict):
            pdf_url = pdf_url.get("value", "")

        metadata = {
            "title": title,
            "short_title": short_title,
            "authors": authors_raw,
            "first_author": first_author,
            "venue": "ICLR 2025",
            "presentation_type": pres_type,
            "openreview_url": f"https://openreview.net/forum?id={note.forum}",
            "openreview_id": note.forum,
            "pdf_url": pdf_url,
            "abstract": note.content.get("abstract", {}).get("value", "") if isinstance(note.content.get("abstract"), dict) else "",
            "keywords": note.content.get("keywords", {}).get("value", "") if isinstance(note.content.get("keywords"), dict) else "",
            "local_pdf": "",
        }

        meta_path = paper_dir / "metadata.json"
        with open(meta_path, "w", encoding="utf-8") as f:
            json.dump(metadata, f, ensure_ascii=False, indent=2)

        results.append({
            "num": i,
            "dir_name": dir_name,
            "title": title,
            "short_title": short_title,
            "first_author": first_author,
            "presentation": pres_type,
            "openreview_url": metadata["openreview_url"],
            "pdf_url": pdf_url,
        })
        print(f"{i}. [{pres_type}] {short_title} - {first_author}")

    # 输出供 README 和 download 脚本使用的索引
    index_path = base_dir / "paper_index.json"
    with open(index_path, "w", encoding="utf-8") as f:
        json.dump(results, f, ensure_ascii=False, indent=2)
    print(f"\n索引已写入: {index_path}")
    return results


if __name__ == "__main__":
    main()
