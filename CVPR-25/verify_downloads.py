#!/usr/bin/env python3
"""
CVPR-25 论文下载验收脚本
检查 papers/ 下各论文目录的 metadata.json，验证对应 PDF 是否已成功下载。
"""
import json
from pathlib import Path

BASE = Path(__file__).resolve().parent
PAPERS = BASE / "papers"
VENUE_SUFFIX = "CVPR2025"


def main():
    if not PAPERS.exists():
        print("papers/ 目录不存在")
        return 1

    ok, missing = [], []

    for dir_path in sorted(PAPERS.iterdir()):
        if not dir_path.is_dir():
            continue

        meta_path = dir_path / "metadata.json"
        if not meta_path.exists():
            missing.append((dir_path.name, None, "无 metadata.json"))
            continue

        try:
            meta = json.loads(meta_path.read_text(encoding="utf-8"))
        except Exception as e:
            missing.append((dir_path.name, None, f"metadata.json 解析失败: {e}"))
            continue

        short = meta.get("short_title", "")
        expected_pdf = meta.get("local_pdf")
        if not expected_pdf and short:
            expected_pdf = f"{short}_{VENUE_SUFFIX}.pdf"

        pdf_path = dir_path / expected_pdf if expected_pdf else None
        has_pdf = pdf_path.exists() if pdf_path else False

        if not has_pdf and dir_path.exists():
            for f in dir_path.glob("*.pdf"):
                has_pdf = True
                break

        if has_pdf:
            ok.append((dir_path.name, short or dir_path.name))
        else:
            url = meta.get("cvf_url") or meta.get("arxiv_url") or ""
            missing.append((dir_path.name, short or dir_path.name, url))

    total = len(ok) + len(missing)
    n_ok = len(ok)

    print("=" * 60)
    print("CVPR-25 论文下载验收报告")
    print("=" * 60)
    print(f"总计: {total} 篇  |  已下载: {n_ok} 篇  |  缺失: {len(missing)} 篇")
    print()

    if missing:
        print("【缺失 PDF】")
        for name, short, url in missing:
            print(f"  {name}" + (f" ({short})" if short else ""))
            if url:
                print(f"      {url}")
        print()
        print("补救: 重新运行 download_papers.ps1 或手动从 CVF/arXiv 下载")
        return 1
    else:
        print("【验收通过】全部论文 PDF 已就绪")
        return 0


if __name__ == "__main__":
    exit(main())
