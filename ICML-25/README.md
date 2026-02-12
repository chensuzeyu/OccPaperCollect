# ICML 2025 - Occupancy 相关论文收集

本文档收集 ICML 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）/ Panoptic Scene Completion** 相关的工作。

ICML 2025 录用论文分布在 **Poster**、**Spotlight**、**Oral** 三类，通过 OpenReview API 全面爬取并过滤。

---

## 论文检索方法

1. **OpenReview API**：使用 `openreview-py` 按 venue 标签（`ICML 2025 poster` / `ICML 2025 spotlightposter` / `ICML 2025 oral`）获取全部录用论文，再用关键词过滤。
2. **检索关键词**：`occupancy`、`semantic scene completion`、`scene completion`、`panoptic scene completion`
3. **官方入口**：[ICML 2025 Conference - OpenReview](https://openreview.net/group?id=ICML.cc/2025/Conference)
   - [Submissions](https://openreview.net/submissions?venue=ICML.cc/2025/Conference)

---

## 论文列表

> 检索关键词：**Occupancy** + **Semantic/Panoptic Scene Completion**（共 2 篇）

| # | 论文简称 | 完整标题 | 第一作者 | 类型 | OpenReview |
|---|----------|----------|----------|------|------------|
| 1 | CAL | Towards Learning to Complete Anything in Lidar | Takmaz | poster | [Link](https://openreview.net/forum?id=vWPzKn6usZ) |
| 2 | CSV-Occ | CSV-Occ: Fusing Multi-frame Alignment for Occupancy Prediction with Temporal Cross State Space Model and Central Voting Mechanism | Zhu | poster | [Link](https://openreview.net/forum?id=7Dt3nH5TZq) |

*注：CAL 即 Complete Anything in Lidar，面向 Lidar-based Semantic/Panoptic Scene Completion 的零样本方法。已排除 policy gradient、occupancy measures（RL）、privacy amplification 等误匹配。*

---

## 本地目录结构

```
ICML-25/
├── README.md                 # 本索引文件
├── fetch_icml25.py           # OpenReview API 爬取脚本（Poster/Spotlight/Oral）
├── verify_downloads.py       # 下载验收脚本
├── paper_index.json          # 爬取结果索引
├── download_papers.ps1       # PDF 下载脚本
└── papers/                   # 各论文子目录（含 metadata.json + PDF）
    ├── TowardsLearningtoCompleteA_Takmaz/   # CAL
    ├── CSV-Occ_Zhu/
    └── ...
```

### 元数据 (metadata.json)

每篇论文目录下包含 `metadata.json`，字段包括：

- `title`：完整标题
- `authors` / `first_author`：作者信息
- `venue`：会议
- `presentation_type`：poster / spotlight / oral
- `openreview_url` / `openreview_id`：OpenReview 链接
- `pdf_url`：OpenReview 内 PDF 路径
- `abstract`：摘要
- `keywords`：关键词
- `local_pdf`：本地 PDF 文件名

---

## 爬取与下载说明

### 1. 爬取论文列表

```bash
pip install openreview-py
python fetch_icml25.py
```

脚本会：
- 从 OpenReview 获取 Poster (~2940) + Spotlight (~210) + Oral (~110) 全部录用论文
- 按关键词过滤 occupancy / scene completion 相关
- 生成 `papers/` 目录与 `metadata.json`
- 输出 `paper_index.json`

### 2. 下载 PDF

```powershell
.\download_papers.ps1
```

PDF 从 OpenReview 下载，URL 格式：`https://openreview.net/pdf?id={forum_id}`。若中途超时/中断，可多次运行，已存在的 PDF 会跳过。

### 3. 验收逻辑

下载完成后，运行验收脚本检查是否全部就绪：

```bash
python verify_downloads.py
```

**验收规则**：
- 以 `paper_index.json` 为准，检查每篇论文对应目录下是否存在 `{short_title}_ICML2025.pdf`
- 输出：已下载数量 / 缺失列表
- 退出码：0 = 全部通过，1 = 存在缺失

**若存在缺失**：重新运行 `download_papers.ps1`，或从对应 OpenReview 链接手动下载 PDF 至该论文目录。

---

*最后更新：2025-02-12*
