# ICLR 2026 - Occupancy 相关论文收集

本文档收集 ICLR 2026 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）/ Panoptic Scene Completion** 相关的工作。

ICLR 2026 录用论文分布在 **Poster**（5120 篇）、**Oral**（223 篇）两类，通过 OpenReview API 全面爬取并过滤。*注：ICLR 2026 未单独标注 Spotlight，Spotlight 论文归入 Oral。*

---

## 论文检索方法

1. **OpenReview API**：使用 `openreview-py` 按 venue 标签（`ICLR 2026 Poster` / `Oral`）获取全部录用论文，再用关键词过滤。
2. **检索关键词**：`occupancy`、`semantic scene completion`、`scene completion`、`panoptic scene completion`
3. **排除关键词**：`reinforcement learning`、`policy gradient`、`imitation learning`、`occupancy reward shaping`、`occupancy measure`（RL 中的 state-action occupancy）、`occupancy matching`、`general relativity`（物理学场）
4. **官方入口**：[ICLR 2026 Conference - OpenReview](https://openreview.net/group?id=ICLR.cc/2026/Conference)
   - [Accept (poster)](https://openreview.net/group?id=ICLR.cc/2026/Conference#tab-accept-poster)
   - [Accept (oral)](https://openreview.net/group?id=ICLR.cc/2026/Conference#tab-accept-oral)

---

## 论文列表

> 检索关键词：**Occupancy** + **Semantic/Panoptic Scene Completion**（共 10 篇）

| # | 论文简称 | 完整标题 | 第一作者 | 类型 | OpenReview |
|---|----------|----------|----------|------|------------|
| 1 | H2OFlow | H2OFlow: Grounding Human-Object Affordances with 3D Generative Models and Dense Diffused Flows | Zhang | poster | [Link](https://openreview.net/forum?id=QhqJ1DCp1X) |
| 2 | OccDriver | OccDriver: Future Occupancy Guided Dual-branch Trajectory Planner in Autonomous Driving | Huang | poster | [Link](https://openreview.net/forum?id=abJCjkIwi5) |
| 3 | Progressive Gaussian Transform | Progressive Gaussian Transformer with Anisotropy-aware Sampling for Open Vocabulary Occupancy Prediction | Yan | poster | [Link](https://openreview.net/forum?id=mHFaflQv93) |
| 4 | S2GO | S2GO: Streaming Sparse Gaussian Occupancy | Park | poster | [Link](https://openreview.net/forum?id=z8ggdMlSco) |
| 5 | GaussianFusion | GaussianFusion: Unified 3D Gaussian Representation for Multi-Modal Fusion Perception | Zhao | poster | [Link](https://openreview.net/forum?id=7jXxQ9bGoU) |
| 6 | G4Splat | G4Splat: Geometry-Guided Gaussian Splatting with Generative Prior | Ni | poster | [Link](https://openreview.net/forum?id=kdPmsMVhZf) |
| 7 | World2Minecraft | World2Minecraft: Occupancy-Driven simulated scenes Construction | Zhang | poster | [Link](https://openreview.net/forum?id=dc90uPqxWF) |
| 8 | UniSplat | UniSplat: Unified Spatio-Temporal Fusion via 3D Latent Scaffolds for Dynamic Driving Scene Reconstruction | Shi | poster | [Link](https://openreview.net/forum?id=Ng2VDbKD4r) |
| 9 | InfBaGel | InfBaGel: Human-Object-Scene Interaction Generation with Dynamic Perception and Iterative Refinement | Zou | poster | [Link](https://openreview.net/forum?id=TeyHNq4WlI) |
| 10 | TINKER | TINKER: Diffusion's Gift to 3D--Multi-View Consistent Editing From Sparse Inputs without Per-Scene Optimization | Zhao | poster | [Link](https://openreview.net/forum?id=j7Vt2lp2jX) |

*注：已排除 reinforcement learning、Occupancy Reward Shaping、Intention-Conditioned Flow Occ（RL 预训练）、On Discovering Algorithms（imitation learning）、Einstein Fields（物理学场）等误匹配。*

---

## 本地目录结构

```
ICLR-26/
├── README.md                 # 本索引文件
├── fetch_iclr26.py           # OpenReview API 爬取脚本（Poster/Oral）
├── verify_downloads.py       # 下载验收脚本
├── paper_index.json          # 爬取结果索引
├── download_papers.ps1       # PDF 下载脚本
└── papers/                   # 各论文子目录（含 metadata.json + PDF）
    ├── OccDriver_Huang/
    ├── ProgressiveGaussianTransform_Yan/
    ├── S2GO_Park/
    ├── ...
    └── ...
```

### 元数据 (metadata.json)

每篇论文目录下包含 `metadata.json`，字段包括：

- `title`：完整标题
- `authors` / `first_author`：作者信息
- `venue`：会议
- `presentation_type`：poster / oral
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
python fetch_iclr26.py
```

脚本会：
- 从 OpenReview 获取 Poster (5120) + Oral (223) 全部录用论文
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
- 以 `paper_index.json` 为准，检查每篇论文对应目录下是否存在 `{short_title}_ICLR2026.pdf`
- 输出：已下载数量 / 缺失列表
- 退出码：0 = 全部通过，1 = 存在缺失

**若存在缺失**：重新运行 `download_papers.ps1`，或从对应 OpenReview 链接手动下载 PDF 至该论文目录。

---

*最后更新：2026-02-12*
