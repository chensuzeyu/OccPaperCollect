#!/usr/bin/env python3
"""
CoRL-25 论文下载验收脚本
检查 paper_index.json 中的每篇论文是否已成功下载 PDF，并输出验收报告。
"""
import json
from pathlib import Path

BASE = Path(__file__).resolve().parent
INDEX = BASE / "paper_index.json"
PAPERS = BASE / "papers"


def main():
    if not INDEX.exists():
        print("请先运行: python fetch_corl25.py")
        return 1

    index = json.loads(INDEX.read_text(encoding="utf-8"))
    ok, missing = [], []

    for p in index:
        dir_path = PAPERS / p["dir_name"]
        short = p["short_title"]
        # 标准命名: {short_title}_CoRL2025.pdf
        expected_pdf = f"{short}_CoRL2025.pdf"
        pdf_path = dir_path / expected_pdf

        # 也检查目录内是否任选 .pdf（兼容其他命名）
        has_pdf = pdf_path.exists()
        if not has_pdf and dir_path.exists():
            for f in dir_path.glob("*.pdf"):
                has_pdf = True
                break

        if has_pdf:
            ok.append((p["num"], short))
        else:
            missing.append((p["num"], short, p["openreview_url"]))

    total = len(index)
    n_ok = len(ok)

    print("=" * 60)
    print("CoRL-25 论文下载验收报告")
    print("=" * 60)
    print(f"总计: {total} 篇  |  已下载: {n_ok} 篇  |  缺失: {len(missing)} 篇")
    print()

    if missing:
        print("【缺失 PDF】")
        for num, short, url in missing:
            print(f"  {num:2}. {short}")
            print(f"      {url}")
        print()
        print("补救: 重新运行 download_papers.ps1 或手动从 OpenReview 下载")
        return 1
    else:
        print("【验收通过】全部论文 PDF 已就绪")
        return 0


if __name__ == "__main__":
    exit(main())
