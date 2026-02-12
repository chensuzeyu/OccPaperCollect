# CoRL 2025 - Occupancy 相关论文收集

本文档收集 CoRL 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）/ Panoptic Scene Completion** 相关的工作。

CoRL 2025 录用论文分布在 **Oral**、**Poster** 两类，通过 OpenReview API 全面爬取并过滤。

---

## 论文检索方法

1. **OpenReview API**：使用 `openreview-py` 按 venue 标签（`CoRL 2025 Oral` / `CoRL 2025 Poster`）获取全部录用论文，再用关键词过滤。
2. **检索关键词**：`occupancy`、`semantic scene completion`、`scene completion`、`panoptic scene completion`
3. **排除关键词**：`reinforcement learning`、`policy gradient`、`imitation learning`、`occupancy measure`（RL 中的 state occupancy）
4. **官方入口**：[CoRL 2025 Conference - OpenReview](https://openreview.net/group?id=robot-learning.org/CoRL/2025/Conference)
   - [Submissions](https://openreview.net/submissions?venue=robot-learning.org%2FCoRL%2F2025%2FConference)

---

## 论文列表

> 检索关键词：**Occupancy** + **Semantic/Panoptic Scene Completion**（共 2 篇）

| # | 论文简称 | 完整标题 | 第一作者 | 类型 | OpenReview |
|---|----------|----------|----------|------|------------|
| 1 | FetchBot | FetchBot: Learning Generalizable Object Fetching in Cluttered Scenes via Zero-Shot Sim2Real | Liu | oral | [Link](https://openreview.net/forum?id=5ySSVlJBOn) |
| 2 | CogniPlan | CogniPlan: Uncertainty-Guided Path Planning with Conditional Generative Layout Prediction | Wang | poster | [Link](https://openreview.net/forum?id=uA9GZEmGiT) |

*注：已排除 Door(s)（reinforcement learning 探索）等误匹配。*

---

## 本地目录结构

```
CoRL-25/
├── README.md                 # 本索引文件
├── fetch_corl25.py           # OpenReview API 爬取脚本（Oral/Poster）
├── verify_downloads.py       # 下载验收脚本
├── paper_index.json          # 爬取结果索引
├── download_papers.ps1       # PDF 下载脚本
└── papers/                   # 各论文子目录（含 metadata.json + PDF）
    └── ...
```

### 元数据 (metadata.json)

每篇论文目录下包含 `metadata.json`，字段包括：

- `title`：完整标题
- `authors` / `first_author`：作者信息
- `venue`：会议
- `presentation_type`：oral / poster
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
python fetch_corl25.py
```

### 2. 下载 PDF

```powershell
.\download_papers.ps1
```

PDF 从 OpenReview 下载，URL 格式：`https://openreview.net/pdf?id={forum_id}`。若中途超时/中断，可多次运行，已存在的 PDF 会跳过。

### 3. 验收逻辑

```bash
python verify_downloads.py
```

**验收规则**：以 `paper_index.json` 为准，检查每篇论文对应目录下是否存在 `{short_title}_CoRL2025.pdf`。

---

*最后更新：2025-02-12*
