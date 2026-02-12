# CVPR 2025 Occupancy & Semantic Scene Completion Papers Download Script
# 检索关键词: Occupancy（14 篇）+ Semantic Scene Completion（3 篇，共 17 篇）
$baseDir = "D:\develop\OccPaperCollect\CVPR-25\papers"

$papers = @(
    @{ Name="GaussianFormer2_Huang"; Title="GaussianFormer2"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Huang_GaussianFormer-2_Probabilistic_Gaussian_Superposition_for_Efficient_3D_Occupancy_Prediction_CVPR_2025_paper.pdf" },
    @{ Name="GDFusion_Chen"; Title="GDFusion"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Chen_Rethinking_Temporal_Fusion_with_a_Unified_Gradient_Descent_View_for_CVPR_2025_paper.pdf" },
    @{ Name="GaussianWorld_Zuo"; Title="GaussianWorld"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Zuo_GaussianWorld_Gaussian_World_Model_for_Streaming_3D_Occupancy_Prediction_CVPR_2025_paper.pdf" },
    @{ Name="SDGOCC_Duan"; Title="SDGOCC"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Duan_SDGOCC_Semantic_and_Depth-Guided_Birds-Eye_View_Transformation_for_3D_CVPR_2025_paper.pdf" },
    @{ Name="EfficientOCF_Xu"; Title="EfficientOCF"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Xu_Spatiotemporal_Decoupling_for_Efficient_Vision-Based_Occupancy_Forecasting_CVPR_2025_paper.pdf" },
    @{ Name="OccMamba_Li"; Title="OccMamba"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Li_OccMamba_Semantic_Occupancy_Prediction_with_State_Space_Models_CVPR_2025_paper.pdf" },
    @{ Name="TopNet_Wang"; Title="TopNet"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Wang_TopNet_Transformer-Efficient_Occupancy_Prediction_Network_for_Octree-Structured_CVPR_2025_paper.pdf" },
    @{ Name="ProtoOcc_Oh"; Title="ProtoOcc"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Oh_3D_Occupancy_Prediction_with_Low-Resolution_Queries_via_Prototype-aware_View_Transformation_CVPR_2025_paper.pdf" },
    @{ Name="STCOcc_Liao"; Title="STCOcc"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Liao_STCOcc_Sparse_Spatial-Temporal_Cascade_Renovation_for_3D_Occupancy_CVPR_2025_paper.pdf" },
    @{ Name="NOMAE_Abdelsamad"; Title="NOMAE"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Abdelsamad_Multi-Scale_Neighborhood_Occupancy_Masked_Autoencoder_for_Self-Supervised_CVPR_2025_paper.pdf" },
    @{ Name="DIO_Diehl"; Title="DIO"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Diehl_DIO_Decomposable_Implicit_4D_Occupancy-Flow_World_Model_CVPR_2025_paper.pdf" },
    @{ Name="VoxelSplat_Zhu"; Title="VoxelSplat"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Zhu_VoxelSplat_Dynamic_Gaussian_Splatting_as_an_Effective_Loss_for_Occupancy_CVPR_2025_paper.pdf" },
    @{ Name="EvOcc_Kalble"; Title="EvOcc"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Kalble_EvOcc_Accurate_Semantic_Occupancy_for_Automated_Driving_Using_Evidence_Theory_CVPR_2025_paper.pdf" },
    @{ Name="UniScene_Li"; Title="UniScene"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Li_UniScene_Unified_Occupancy-centric_Driving_Scene_Generation_CVPR_2025_paper.pdf" },
    @{ Name="SGFormer_Guo"; Title="SGFormer"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Guo_SGFormer_Satellite-Ground_Fusion_for_3D_Semantic_Scene_Completion_CVPR_2025_paper.pdf" },
    @{ Name="ScanSSC_Bae"; Title="ScanSSC"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Bae_Three_Cars_Approaching_within_100m_Enhancing_Distant_Geometry_by_Tri-Axis_CVPR_2025_paper.pdf" },
    @{ Name="SOAP_Lee"; Title="SOAP"; Url="https://openaccess.thecvf.com/content/CVPR2025/papers/Lee_SOAP_Vision-Centric_3D_Semantic_Scene_Completion_with_Scene-Adaptive_Decoder_and_CVPR_2025_paper.pdf" }
)

# CVF 404 时使用 arXiv 备用（ArxivId 可选）
$arxivFallback = @{
    "SDGOCC_Duan" = "2507.17083"
    "TopNet_Wang" = "2503.18541"
    "STCOcc_Liao" = "2504.19749"
    "NOMAE_Abdelsamad" = "2502.20316"
}

foreach ($p in $papers) {
    $dir = Join-Path $baseDir $p.Name
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    $outFile = Join-Path $dir "$($p.Title)_CVPR2025.pdf"
    if (!(Test-Path $outFile)) {
        $ok = $false
        try {
            Write-Host "Downloading $($p.Title) (CVF)..."
            Invoke-WebRequest -Uri $p.Url -OutFile $outFile -UseBasicParsing -TimeoutSec 90
            Write-Host "  OK: $outFile"
            $ok = $true
        } catch {
            Write-Host "  CVF FAIL, trying arXiv..."
        }
        if (!$ok -and $arxivFallback[$p.Name]) {
            try {
                $arxivUrl = "https://arxiv.org/pdf/$($arxivFallback[$p.Name]).pdf"
                Invoke-WebRequest -Uri $arxivUrl -OutFile $outFile -UseBasicParsing -TimeoutSec 90
                Write-Host "  OK (arXiv): $outFile"
            } catch {
                Write-Host "  FAIL: $($p.Title) - $($_.Exception.Message)"
            }
        } elseif (!$ok) {
            Write-Host "  FAIL: $($p.Title) - no arXiv fallback"
        }
    } else {
        Write-Host "Skip (exists): $($p.Title)"
    }
}
