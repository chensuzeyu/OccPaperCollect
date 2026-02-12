# NeurIPS 2025 - Occupancy 相关论文收集

本文档收集 NeurIPS 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）/ Panoptic Scene Completion** 相关的工作。

NeurIPS 2025 录用论文分布在 **Poster**、**Spotlight**、**Oral** 三类，通过 OpenReview API 全面爬取并过滤。

---

## 论文检索方法

1. **OpenReview API**：使用 `openreview-py` 按 venue 标签（`NeurIPS 2025 poster` / `spotlight` / `oral`）获取全部录用论文，再用关键词过滤。
2. **检索关键词**：`occupancy`、`semantic scene completion`、`scene completion`、`panoptic scene completion`
3. **排除关键词**：`reinforcement learning`、`policy gradient`、`imitation learning`、`bandit`、`reward hacking`、`occupancy measure`（RL 中的 state-action occupancy）、`occupancy matching`、`RLGU`
4. **官方入口**：[NeurIPS 2025 Conference - OpenReview](https://openreview.net/group?id=NeurIPS.cc/2025/Conference)
   - [Accept (poster)](https://openreview.net/group?id=NeurIPS.cc/2025/Conference#tab-accept-poster)
   - [Accept (spotlight)](https://openreview.net/group?id=NeurIPS.cc/2025/Conference#tab-accept-spotlight)
   - [Accept (oral)](https://openreview.net/group?id=NeurIPS.cc/2025/Conference#tab-accept-oral)

---

## 论文列表

> 检索关键词：**Occupancy** + **Semantic/Panoptic Scene Completion**（共 17 篇）

| # | 论文简称 | 完整标题 | 第一作者 | 类型 | OpenReview |
|---|----------|----------|----------|------|------------|
| 1 | CADGrasp | Learning Contact and Collision Aware General Dexterous Grasping in Cluttered Scenes | Zhang | poster | [Link](https://openreview.net/forum?id=CB8jwNE2vV) |
| 2 | CymbaDiff | Structured Spatial Diffusion for Sketch-based 3D Semantic Urban Scene Generation | Liang | poster | [Link](https://openreview.net/forum?id=hFyIIqmcqf) |
| 3 | Towards foundational LiDAR | Towards foundational LiDAR world models with efficient latent flow matching | Liu | poster | [Link](https://openreview.net/forum?id=OyX9cC9WaV) |
| 4 | IPFormer | Visual 3D Panoptic Scene Completion with Context-Adaptive Instance Proposals | Gross | poster | [Link](https://openreview.net/forum?id=Y0hymKkn2a) |
| 5 | RayFusion | Ray Fusion Enhanced Collaborative Visual Perception | Wang | poster | [Link](https://openreview.net/forum?id=eK61hWzAAl) |
| 6 | RaySt3R | Predicting Novel Depth Maps for Zero-Shot Object Completion | Duisterhof | poster | [Link](https://openreview.net/forum?id=NpRbTTgRBG) |
| 7 | Learning Temporal 3D Semantic | Learning Temporal 3D Semantic Scene Completion via Optical Flow Guidance | Wang | poster | [Link](https://openreview.net/forum?id=nK5WovvHk2) |
| 8 | See through the Dark | Learning Illumination-affined Representations for Nighttime Occupancy Prediction | Wuyuan | poster | [Link](https://openreview.net/forum?id=2Yk4GnB3DY) |
| 9 | Object Concepts Emerge from Mo | Object Concepts Emerge from Motion | Liang | poster | [Link](https://openreview.net/forum?id=QFOhUboCvp) |
| 10 | COME | Adding Scene-Centric Forecasting Control to Occupancy World Model | Shi | poster | [Link](https://openreview.net/forum?id=EYxLmZRSK1) |
| 11 | ODG | Occupancy Prediction Using Dual Gaussians | Shi | poster | [Link](https://openreview.net/forum?id=CkmLys7ipp) |
| 12 | EA3D | Online Open-World 3D Object Extraction from Streaming Videos | Zhou | poster | [Link](https://openreview.net/forum?id=7aDKD8RBUw) |
| 13 | QuadricFormer | Scene as Superquadrics for 3D Semantic Occupancy Prediction | Zuo | poster | [Link](https://openreview.net/forum?id=eZNdkwJYbN) |
| 14 | X-Scene | Large-Scale Driving Scene Generation with High Fidelity and Flexible Controllability | Yang | poster | [Link](https://openreview.net/forum?id=QclFsekj9B) |
| 15 | Dynamic Focused Masking | Dynamic Focused Masking for Autoregressive Embodied Occupancy Prediction | Sun | poster | [Link](https://openreview.net/forum?id=PvEnRUWSfn) |
| 16 | SQS | Enhancing Sparse Perception Models via Query-based Splatting in Autonomous Driving | Zhang | spotlight | [Link](https://openreview.net/forum?id=plpAecfkf4) |
| 17 | VoxDet | Rethinking 3D Semantic Scene Completion as Dense Object Detection | Li | spotlight | [Link](https://openreview.net/forum?id=lMhNrt0Bnm) |

*注：已排除 reinforcement learning、policy gradient、imitation learning、bandit、RLGF、IOSTOM 等 RL 相关误匹配。*

---

## 本地目录结构

```
NeurIPS-25/
├── README.md                 # 本索引文件
├── fetch_neurips25.py        # OpenReview API 爬取脚本（Poster/Spotlight/Oral）
├── verify_downloads.py       # 下载验收脚本
├── paper_index.json          # 爬取结果索引
├── download_papers.ps1       # PDF 下载脚本
└── papers/                   # 各论文子目录（含 metadata.json + PDF）
    ├── IPFormer_Gross/
    ├── QuadricFormer_Zuo/
    ├── ODG_Shi/
    ├── VoxDet_Li/
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
python fetch_neurips25.py
```

脚本会：
- 从 OpenReview 获取 Poster (4522) + Spotlight (687) + Oral (77) 全部录用论文
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
- 以 `paper_index.json` 为准，检查每篇论文对应目录下是否存在 `{short_title}_NeurIPS2025.pdf`
- 输出：已下载数量 / 缺失列表
- 退出码：0 = 全部通过，1 = 存在缺失

**若存在缺失**：重新运行 `download_papers.ps1`，或从对应 OpenReview 链接手动下载 PDF 至该论文目录。

---

*最后更新：2025-02-12*
