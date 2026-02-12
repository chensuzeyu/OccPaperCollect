# ICLR 2025 - Occupancy 相关论文收集

本文档收集 ICLR 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）/ Panoptic Scene Completion** 相关的工作。

ICLR 2025 录用论文分布在 **Poster**、**Spotlight**、**Oral** 三类，通过 OpenReview API 全面爬取并过滤。

---

## 论文检索方法

1. **OpenReview API**：使用 `openreview-py` 按 venue 标签（`ICLR 2025 Poster` / `Spotlight` / `Oral`）获取全部录用论文，再用关键词过滤。
2. **检索关键词**：`occupancy`、`semantic scene completion`、`scene completion`、`panoptic scene completion`
3. **排除关键词**：`reinforcement learning`、`policy gradient`、`imitation learning`、`reward hacking`、`occupancy measure`（RL 中的 state-action occupancy）
4. **官方入口**：[ICLR 2025 Conference - OpenReview](https://openreview.net/group?id=ICLR.cc/2025/Conference)
   - [Accept (poster)](https://openreview.net/group?id=ICLR.cc/2025/Conference#tab-accept-poster)
   - [Accept (spotlight)](https://openreview.net/group?id=ICLR.cc/2025/Conference#tab-accept-spotlight)
   - [Accept (oral)](https://openreview.net/group?id=ICLR.cc/2025/Conference#tab-accept-oral)

---

## 论文列表

> 检索关键词：**Occupancy** + **Semantic/Panoptic Scene Completion**（共 7 篇）

| # | 论文简称 | 完整标题 | 第一作者 | 类型 | OpenReview |
|---|----------|----------|----------|------|------------|
| 1 | ConcreTizer | Model Inversion Attack via Occupancy Classification and Dispersion Control for 3D Point Cloud Restoration | Kim | poster | [Link](https://openreview.net/forum?id=I4iZmsV4HM) |
| 2 | Semi-Supervised Vision-Centric | Semi-Supervised Vision-Centric 3D Occupancy World Model for Autonomous Driving | Li | poster | [Link](https://openreview.net/forum?id=rCX9l4OTCT) |
| 3 | Point-based Instance Completio | Point-based Instance Completion with Scene Constraints | Khademi | poster | [Link](https://openreview.net/forum?id=llSiIJosDj) |
| 4 | Uncertainty modeling for fine- | Uncertainty modeling for fine-tuned implicit functions | Susmelj | poster | [Link](https://openreview.net/forum?id=iZl0VqEdxa) |
| 5 | OccProphet | Pushing the Efficiency Frontier of Camera-Only 4D Occupancy Forecasting with an Observer-Forecaster-Refiner Framework | Chen | poster | [Link](https://openreview.net/forum?id=vC7AlY1ytz) |
| 6 | ImagineNav | Prompting Vision-Language Models as Embodied Navigator through Scene Imagination | Zhao | poster | [Link](https://openreview.net/forum?id=vQFw9ryKyK) |
| 7 | DynamicCity | Large-Scale 4D Occupancy Generation from Dynamic Scenes | Bian | spotlight | [Link](https://openreview.net/forum?id=M7KyLjuN0A) |

*注：已排除 reinforcement learning、policy gradient、reward hacking、Correlated Proxies（RL）等误匹配。*

---

## 本地目录结构

```
ICLR-25/
├── README.md                 # 本索引文件
├── fetch_iclr25.py           # OpenReview API 爬取脚本（Poster/Spotlight/Oral）
├── verify_downloads.py        # 下载验收脚本
├── paper_index.json          # 爬取结果索引
├── download_papers.ps1       # PDF 下载脚本
└── papers/                   # 各论文子目录（含 metadata.json + PDF）
    ├── OccProphet_Chen/
    ├── DynamicCity_Bian/
    ├── ...
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
python fetch_iclr25.py
```

脚本会：
- 从 OpenReview 获取 Poster (3110) + Spotlight (380) + Oral (213) 全部录用论文
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
- 以 `paper_index.json` 为准，检查每篇论文对应目录下是否存在 `{short_title}_ICLR2025.pdf`
- 输出：已下载数量 / 缺失列表
- 退出码：0 = 全部通过，1 = 存在缺失

**若存在缺失**：重新运行 `download_papers.ps1`，或从对应 OpenReview 链接手动下载 PDF 至该论文目录。

---

*最后更新：2025-02-12*
