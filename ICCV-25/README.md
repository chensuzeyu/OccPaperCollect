# ICCV 2025 - Occupancy 相关论文收集

本文档收集 ICCV 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）** 相关的工作。

---

## 论文检索方法（Paper Copilot 思路）

为确保检索全面、不遗漏，建议使用以下方式发现论文：

1. **Paper Copilot**：[ICCV 2025 Paper List](https://papercopilot.com/paper-list/iccv-paper-list/iccv-2025-paper-list) 支持按关键词搜索（如 `occupancy`、`scene completion`）。在表格上方的搜索框中输入关键词，或使用列筛选项「Click to Fetch All」加载全部记录后再过滤，可系统性地获取标题中含该词的录用论文。**语义场景补全（Semantic Scene Completion）**与 Occupancy 强相关，建议补充检索。
2. **排除关键词**：`reinforcement learning`、`policy gradient`、`imitation learning`、`occupancy measure`（RL 中的 state-action occupancy）
3. **ICCV 官方**：[Accepted Papers](https://iccv.thecvf.com/Conferences/2025/AcceptedPapers) 与 [Search](https://iccv.thecvf.com/virtual/2025/search?q=occupancy) 作为补充校验。
4. **Open Access**：[ICCV 2025 Open Access](https://openaccess.thecvf.com/ICCV2025) 用于核对 PDF 是否已开放，并获取正式链接。

---

## 论文列表

> 检索关键词：**Occupancy**（15 篇）+ **Semantic Scene Completion / 语义场景补全**（4 篇，共 19 篇）

| # | 论文简称 | 完整标题 | 第一作者 | arXiv | CVF PDF | 项目页 |
|---|----------|----------|----------|-------|---------|--------|
| 1 | AutoOcc | Automatic Open-Ended Semantic Occupancy Annotation via Vision-Language Guided Gaussian Splatting | Zhou | [2502.04981](https://arxiv.org/abs/2502.04981) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Zhou_AutoOcc_Automatic_Open-Ended_Semantic_Occupancy_Annotation_via_Vision-Language_Guided_Gaussian_ICCV_2025_paper.pdf) | - |
| 2 | ST-Occ | Occupancy Learning with Spatiotemporal Memory | Leng | [2508.04705](https://arxiv.org/abs/2508.04705) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Leng_Occupancy_Learning_with_Spatiotemporal_Memory_ICCV_2025_paper.pdf) | - |
| 3 | GS-Occ3D | Scaling Vision-only Occupancy Reconstruction with Gaussian Splatting | Ye | [2507.19451](https://arxiv.org/abs/2507.19451) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Ye_GS-Occ3D_Scaling_Vision-only_Occupancy_Reconstruction_with_Gaussian_Splatting_ICCV_2025_paper.pdf) | [gs-occ3d.github.io](https://gs-occ3d.github.io/) |
| 4 | GENO | Gaussian-based World Model: Gaussian Priors for Voxel-Based Occupancy Prediction and Future Motion Prediction | Feng | - | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Feng_Gaussian-based_World_Model_Gaussian_Priors_for_Voxel-Based_Occupancy_Prediction_and_ICCV_2025_paper.pdf) | - |
| 5 | UniOcc | A Unified Benchmark for Occupancy Forecasting and Prediction in Autonomous Driving | Wang | - | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Wang_UniOcc_A_Unified_Benchmark_for_Occupancy_Forecasting_and_Prediction_in_ICCV_2025_paper.pdf) | - |
| 6 | LOcc | Language Driven Occupancy Prediction | Yu | [2411.16072](https://arxiv.org/abs/2411.16072) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Yu_Language_Driven_Occupancy_Prediction_ICCV_2025_paper.pdf) | - |
| 7 | GaussianOcc | Fully Self-supervised and Efficient 3D Occupancy Estimation with Gaussian Splatting | Gan | [2408.11447](https://arxiv.org/abs/2408.11447) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Gan_GaussianOcc_Fully_Self-supervised_and_Efficient_3D_Occupancy_Estimation_with_Gaussian_ICCV_2025_paper.pdf) | - |
| 8 | AGO | Adaptive Grounding for Open World 3D Occupancy Prediction | Li | [2504.10117](https://arxiv.org/abs/2504.10117) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Li_AGO_Adaptive_Grounding_for_Open_World_3D_Occupancy_Prediction_ICCV_2025_paper.pdf) | [edwardleelpz.github.io/AGO](https://edwardleelpz.github.io/AGO_Page) |
| 9 | GaussianFlowOcc | Sparse and Weakly Supervised Occupancy Estimation using Gaussian Splatting and Temporal Flow | Boeder | [2502.17288](https://arxiv.org/abs/2502.17288) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Boeder_GaussianFlowOcc_Sparse_and_Weakly_Supervised_Occupancy_Estimation_using_Gaussian_ICCV_2025_paper.pdf) | - |
| 10 | GaussRender | Learning 3D Occupancy with Gaussian Rendering | Chambon | [2502.05040](https://arxiv.org/abs/2502.05040) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Chambon_GaussRender_Learning_3D_Occupancy_with_Gaussian_Rendering_ICCV_2025_paper.pdf) | - |
| 11 | ALOcc | Adaptive Lifting-based 3D Semantic Occupancy and Cost Volume-based Flow Predictions | Chen | [2411.07725](https://arxiv.org/abs/2411.07725) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Chen_ALOcc_Adaptive_Lifting-based_3D_Semantic_Occupancy_and_Cost_Volume-based_Flow_ICCV_2025_paper.pdf) | - |
| 12 | RIOcc | Efficient Cross-Modal Fusion Transformer with Collaborative Feature Refinement for 3D Semantic Occupancy Prediction | Fan | - | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Fan_RIOcc_Efficient_Cross-Modal_Fusion_Transformer_with_Collaborative_Feature_Refinement_ICCV_2025_paper.pdf) | - |
| 13 | MergeOcc | Bridge the Domain Gap between Different LiDARs for Robust Occupancy Prediction | Xu | [2403.08512](https://arxiv.org/abs/2403.08512) | CVF 未开放，已用 arXiv | [GitHub](https://github.com/Easonxu-01/MergeOcc_simple) |
| 14 | EmbodiedOcc | Embodied 3D Occupancy Prediction for Vision-based Online Scene Understanding | Wu | [2412.04380](https://arxiv.org/abs/2412.04380) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Wu_EmbodiedOcc_Embodied_3D_Occupancy_Prediction_for_Vision-based_Online_Scene_ICCV_2025_paper.pdf) | [GitHub](https://github.com/YkiWu/EmbodiedOcc) |
| 15 | MCOP | Multi-UAV Collaborative Occupancy Prediction | Lin | [2510.12679](https://arxiv.org/abs/2510.12679) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Lin_MCOP_Multi-UAV_Collaborative_Occupancy_Prediction_ICCV_2025_paper.pdf) | - |
| 16 | GA-MonoSSC | Global-Aware Monocular Semantic Scene Completion with State Space Models | Li | [2503.06569](https://arxiv.org/abs/2503.06569) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Li_Global-Aware_Monocular_Semantic_Scene_Completion_with_State_Space_Models_ICCV_2025_paper.pdf) | - |
| 17 | MonoMRN | Monocular Semantic Scene Completion via Masked Recurrent Networks | Wang | [2507.17661](https://arxiv.org/abs/2507.17661) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Wang_Monocular_Semantic_Scene_Completion_via_Masked_Recurrent_Networks_ICCV_2025_paper.pdf) | [GitHub](https://github.com/alanWXZ/MonoMRN) |
| 18 | SceneDINO | Feed-Forward SceneDINO for Unsupervised Semantic Scene Completion | Jevtić | - | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Jevtic_Feed-Forward_SceneDINO_for_Unsupervised_Semantic_Scene_Completion_ICCV_2025_paper.pdf) | [项目页](https://visinf.github.io/scenedino/) |
| 19 | DISC | Disentangling Instance and Scene Contexts for 3D Semantic Scene Completion | Liu | [2507.08416](https://arxiv.org/abs/2507.08416) | [CVF](https://openaccess.thecvf.com/content/ICCV2025/papers/Liu_Disentangling_Instance_and_Scene_Contexts_for_3D_Semantic_Scene_Completion_ICCV_2025_paper.pdf) | [GitHub](https://github.com/Enyu-Liu/DISC) |

---

## 本地目录结构

```
ICCV-25/
├── README.md                 # 本索引文件
├── verify_downloads.py       # 下载验收脚本
├── papers/                   # 各论文子目录（含 PDF 与 metadata.json）
│   ├── AutoOcc_Zhou/
│   │   ├── AutoOcc_ICCV2025.pdf
│   │   └── metadata.json
│   ├── ST-Occ_Leng/
│   ├── GS-Occ3D_Ye/
│   ├── GENO_Feng/
│   ├── UniOcc_Wang/
│   ├── LOcc_Yu/
│   ├── GaussianOcc_Gan/
│   ├── AGO_Li/
│   ├── GaussianFlowOcc_Boeder/
│   ├── GaussRender_Chambon/
│   ├── ALOcc_Chen/
│   ├── RIOcc_Fan/
│   ├── MergeOcc_Xu/          # 仅 arXiv PDF（CVF 暂未开放）
│   ├── EmbodiedOcc_Wu/
│   ├── MCOP_Lin/
│   ├── GA-MonoSSC_Li/
│   ├── MonoMRN_Wang/
│   ├── SceneDINO_Jevtic/
│   └── DISC_Liu/
└── download_papers.ps1       # 下载脚本
```

### 元数据 (metadata.json)

每篇论文目录下包含 `metadata.json`，字段包括：

- `title`：完整标题  
- `authors` / `first_author`：作者信息  
- `venue`：会议  
- `arxiv_id` / `arxiv_url`：arXiv 链接  
- `cvf_url`：CVF 官方 PDF 链接  
- `project_url`：项目页 / GitHub  
- `abstract`：摘要（部分需至 arXiv/CVF 查看）  
- `local_pdf`：本地 PDF 文件名  
- `keywords`：关键词（含 occupancy 等）  
- `notes`：备注

---

## PDF 检索与补救逻辑

### 检索顺序

1. **优先 CVF**：在 [ICCV 2025 Open Access](https://openaccess.thecvf.com/ICCV2025) 按论文标题/作者查找并尝试下载官方 PDF。
2. **其次 arXiv**：在 [arXiv.org](https://arxiv.org) 用论文简称、完整标题或作者名搜索，确认是否有预印本。

### CVF 未开放时的补救流程

当 CVF 链接 404 或暂未开放时：

1. **转向 arXiv 检索**：用论文标题、Short Title、作者名、项目名（如 MergeOcc、MergeOcc_simple）等在 arXiv 全文搜索。
2. **若有 arXiv 版本**：下载 arXiv PDF 至对应论文目录，更新 `metadata.json`（`arxiv_id`、`arxiv_url`、`local_pdf`、`pdf_source: "arXiv"`），并在 README 表格中标注「CVF 未开放，已用 arXiv」。
3. **若 CVF 与 arXiv 均无 PDF**：在下方「无 PDF 论文」区记录，写明：论文简称、完整标题、第一作者、检索结果（CVF 404、arXiv 未找到），以便后续跟进。

### 无 PDF 论文

| 论文简称 | 完整标题 | 第一作者 | 检索说明 |
|----------|----------|----------|----------|
| （暂无） | - | - | CVF 未开放时会优先查 arXiv；两者都无时在此登记 |

---

## 下载与验收说明

### 下载 PDF

- **CVF 官方 PDF**：`https://openaccess.thecvf.com/content/ICCV2025/papers/{FirstAuthor}_{ShortTitle}_ICCV_2025_paper.pdf`
- **arXiv PDF**：`https://arxiv.org/pdf/{arXiv_ID}.pdf`
- 部分论文可能尚未在 CVF 开放，按上述补救流程优先使用 arXiv。

### 验收逻辑

```bash
python verify_downloads.py
```

**验收规则**：以各论文目录下的 `metadata.json` 为准，检查 `local_pdf` 对应文件是否存在；若无 `local_pdf` 字段则尝试 `{short_title}_ICCV2025.pdf`。

---

*最后更新：2025-02-12*
