# CVPR 2025 - Occupancy 相关论文收集

本文档收集 CVPR 2025 录用论文中与 **3D Occupancy / Semantic Occupancy / Occupancy Prediction / 语义场景补全（Semantic Scene Completion）** 相关的工作。

---

## 论文检索方法（Paper Copilot 思路）

为确保检索全面、不遗漏，建议使用以下方式发现论文：

1. **Paper Copilot**：[CVPR 2025 Paper List](https://papercopilot.com/paper-list/cvpr-paper-list/cvpr-2025-paper-list) 支持按关键词搜索（如 `occupancy`、`scene completion`）。在表格上方的搜索框中输入关键词，或使用列筛选项「Click to Fetch All」加载全部记录后再过滤，可系统性地获取标题中含该词的录用论文。**语义场景补全（Semantic Scene Completion）**与 Occupancy 强相关，建议补充检索。
2. **CVPR 官方**：[Accepted Papers](https://cvpr.thecvf.com/Conferences/2025/AcceptedPapers) 与 [Search](https://cvpr.thecvf.com/virtual/2025/search?q=occupancy) 作为补充校验。
3. **Open Access**：[CVPR 2025 Open Access](https://openaccess.thecvf.com/CVPR2025) 用于核对 PDF 是否已开放，并获取正式链接。

---

## 论文列表

> 检索关键词：**Occupancy**（14 篇）+ **Semantic Scene Completion / 语义场景补全**（3 篇，共 17 篇）

| # | 论文简称 | 完整标题 | 第一作者 | arXiv | CVF PDF | 项目页 |
|---|----------|----------|----------|-------|---------|--------|
| 1 | GaussianFormer-2 | Probabilistic Gaussian Superposition for Efficient 3D Occupancy Prediction | Huang | [2412.04384](https://arxiv.org/abs/2412.04384) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Huang_GaussianFormer-2_Probabilistic_Gaussian_Superposition_for_Efficient_3D_Occupancy_Prediction_CVPR_2025_paper.pdf) | [GitHub](https://github.com/huang-yh/GaussianFormer) |
| 2 | GDFusion | Rethinking Temporal Fusion with A Unified Gradient Descent View for 3D Semantic Occupancy Prediction | Chen | [2504.12959](https://arxiv.org/abs/2504.12959) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Chen_Rethinking_Temporal_Fusion_with_a_Unified_Gradient_Descent_View_for_CVPR_2025_paper.pdf) | [GitHub](https://github.com/cdb342/GDFusion) |
| 3 | GaussianWorld | Gaussian World Model for Streaming 3D Occupancy Prediction | Zuo | [2412.10373](https://arxiv.org/abs/2412.10373) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Zuo_GaussianWorld_Gaussian_World_Model_for_Streaming_3D_Occupancy_Prediction_CVPR_2025_paper.pdf) | [GitHub](https://github.com/zuosc19/GaussianWorld) |
| 4 | SDGOCC | Semantic and Depth-Guided Bird's-Eye View Transformation for 3D Multimodal Occupancy Prediction | Duan | [2507.17083](https://arxiv.org/abs/2507.17083) | CVF 未开放，已用 arXiv | [GitHub](https://github.com/DzpLab/SDGOCC) |
| 5 | EfficientOCF | Spatiotemporal Decoupling for Efficient Vision-Based Occupancy Forecasting | Xu | [2411.14169](https://arxiv.org/abs/2411.14169) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Xu_Spatiotemporal_Decoupling_for_Efficient_Vision-Based_Occupancy_Forecasting_CVPR_2025_paper.pdf) | [GitHub](https://github.com/bit-xjy/efficientocf) |
| 6 | OccMamba | Semantic Occupancy Prediction with State Space Models | Li | [2408.09859](https://arxiv.org/abs/2408.09859) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Li_OccMamba_Semantic_Occupancy_Prediction_with_State_Space_Models_CVPR_2025_paper.pdf) | [GitHub](https://github.com/USTCLH/OccMamba) |
| 7 | TopNet | Transformer-Efficient Occupancy Prediction Network for Octree-Structured Point Cloud Geometry Compression | Wang | [2503.18541](https://arxiv.org/abs/2503.18541) | CVF 未开放，已用 arXiv | [GitHub](https://github.com/xinjiewang1995/topnet) |
| 8 | ProtoOcc | 3D Occupancy Prediction with Low-Resolution Queries via Prototype-aware View Transformation | Oh | [2503.15185](https://arxiv.org/abs/2503.15185) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Oh_3D_Occupancy_Prediction_with_Low-Resolution_Queries_via_Prototype-aware_View_Transformation_CVPR_2025_paper.pdf) | [项目页](https://kuai-lab.github.io/cvpr2025protoocc/) |
| 9 | STCOcc | Sparse Spatial-Temporal Cascade Renovation for 3D Occupancy and Scene Flow Prediction | Liao | [2504.19749](https://arxiv.org/abs/2504.19749) | CVF 未开放，已用 arXiv | [GitHub](https://github.com/lzzzzzm/STCOcc) |
| 10 | NOMAE | Multi-Scale Neighborhood Occupancy Masked Autoencoder for Self-Supervised Learning in LiDAR Point Clouds | Abdelsamad | [2502.20316](https://arxiv.org/abs/2502.20316) | CVF 未开放，已用 arXiv | - |
| 11 | DIO | Decomposable Implicit 4D Occupancy-Flow World Model | Diehl | [2412.13772](https://arxiv.org/abs/2412.13772) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Diehl_DIO_Decomposable_Implicit_4D_Occupancy-Flow_World_Model_CVPR_2025_paper.pdf) | [Waabi](https://waabi.ai/research/dio) |
| 12 | VoxelSplat | Dynamic Gaussian Splatting as an Effective Loss for Occupancy and Flow Prediction | Zhu | [2506.05563](https://arxiv.org/abs/2506.05563) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Zhu_VoxelSplat_Dynamic_Gaussian_Splatting_as_an_Effective_Loss_for_Occupancy_CVPR_2025_paper.pdf) | [Demo](https://zzy816.github.io/VoxelSplat-Demo/) |
| 13 | EvOcc | Accurate Semantic Occupancy for Automated Driving Using Evidence Theory | Kälble | - | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Kalble_EvOcc_Accurate_Semantic_Occupancy_for_Automated_Driving_Using_Evidence_Theory_CVPR_2025_paper.pdf) | [GitHub](https://github.com/boschresearch/evocc) |
| 14 | UniScene | Unified Occupancy-centric Driving Scene Generation | Li | [2412.05435](https://arxiv.org/abs/2412.05435) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Li_UniScene_Unified_Occupancy-centric_Driving_Scene_Generation_CVPR_2025_paper.pdf) | [GitHub](https://github.com/Arlo0o/UniScene-Unified-Occupancy-centric-Driving-Scene-Generation) |
| 15 | SGFormer | Satellite-Ground Fusion for 3D Semantic Scene Completion | Guo | [2503.16825](https://arxiv.org/abs/2503.16825) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Guo_SGFormer_Satellite-Ground_Fusion_for_3D_Semantic_Scene_Completion_CVPR_2025_paper.pdf) | [GitHub](https://github.com/gxytcrc/SGFormer) |
| 16 | ScanSSC | Three Cars Approaching within 100m! Enhancing Distant Geometry by Tri-Axis Voxel Scanning for Camera-based Semantic Scene Completion | Bae | [2411.16129](https://arxiv.org/abs/2411.16129) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Bae_Three_Cars_Approaching_within_100m_Enhancing_Distant_Geometry_by_Tri-Axis_CVPR_2025_paper.pdf) | - |
| 17 | SOAP | Vision-Centric 3D Semantic Scene Completion with Scene-Adaptive Decoder and Occluded Region-Aware View Projection | Lee | [2507.08555](https://arxiv.org/abs/2507.08555) | [CVF](https://openaccess.thecvf.com/content/CVPR2025/papers/Lee_SOAP_Vision-Centric_3D_Semantic_Scene_Completion_with_Scene-Adaptive_Decoder_and_CVPR_2025_paper.pdf) | [GitHub](https://github.com/gywns6287/SOAP) |

---

## 本地目录结构

```
CVPR-25/
├── README.md                 # 本索引文件
├── papers/                   # 各论文子目录（含 PDF 与 metadata.json）
│   ├── GaussianFormer2_Huang/
│   ├── GDFusion_Chen/
│   ├── GaussianWorld_Zuo/
│   ├── SDGOCC_Duan/
│   ├── EfficientOCF_Xu/
│   ├── OccMamba_Li/
│   ├── TopNet_Wang/
│   ├── ProtoOcc_Oh/
│   ├── STCOcc_Liao/
│   ├── NOMAE_Abdelsamad/
│   ├── DIO_Diehl/
│   ├── VoxelSplat_Zhu/
│   ├── EvOcc_Kalble/
│   ├── UniScene_Li/
│   ├── SGFormer_Guo/
│   ├── ScanSSC_Bae/
│   ├── SOAP_Lee/
│   └── ...
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

1. **优先 CVF**：在 [CVPR 2025 Open Access](https://openaccess.thecvf.com/CVPR2025) 按论文标题/作者查找并尝试下载官方 PDF。
2. **其次 arXiv**：在 [arXiv.org](https://arxiv.org) 用论文简称、完整标题或作者名搜索，确认是否有预印本。

### CVF 未开放时的补救流程

当 CVF 链接 404 或暂未开放时：

1. **转向 arXiv 检索**：用论文标题、Short Title、作者名、项目名等在 arXiv 全文搜索。
2. **若有 arXiv 版本**：下载 arXiv PDF 至对应论文目录，更新 `metadata.json`（`arxiv_id`、`arxiv_url`、`local_pdf`、`pdf_source: "arXiv"`），并在 README 表格中标注「CVF 未开放，已用 arXiv」。
3. **若 CVF 与 arXiv 均无 PDF**：在下方「无 PDF 论文」区记录，写明：论文简称、完整标题、第一作者、检索结果（CVF 404、arXiv 未找到），以便后续跟进。

### 无 PDF 论文

| 论文简称 | 完整标题 | 第一作者 | 检索说明 |
|----------|----------|----------|----------|
| （暂无） | - | - | CVF 未开放时会优先查 arXiv；两者都无时在此登记 |

---

## 下载说明

- **CVF 官方 PDF**：`https://openaccess.thecvf.com/content/CVPR2025/papers/{FirstAuthor}_{ShortTitle}_CVPR_2025_paper.pdf`
- **arXiv PDF**：`https://arxiv.org/pdf/{arXiv_ID}.pdf`
- 部分论文可能尚未在 CVF 开放，按上述补救流程优先使用 arXiv。

---

*最后更新：2025-02-12*
