# ICCV 2025 Occupancy & Semantic Scene Completion Papers Download Script
$baseDir = "D:\develop\OccPaperCollect\ICCV-25\papers"

$papers = @(
    @{Name="ST-Occ_Leng"; Title="ST-Occ"; Author="Leng"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Leng_Occupancy_Learning_with_Spatiotemporal_Memory_ICCV_2025_paper.pdf"},
    @{Name="GS-Occ3D_Ye"; Title="GS-Occ3D"; Author="Ye"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Ye_GS-Occ3D_Scaling_Vision-only_Occupancy_Reconstruction_with_Gaussian_Splatting_ICCV_2025_paper.pdf"},
    @{Name="GENO_Feng"; Title="GENO"; Author="Feng"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Feng_Gaussian-based_World_Model_Gaussian_Priors_for_Voxel-Based_Occupancy_Prediction_and_ICCV_2025_paper.pdf"},
    @{Name="UniOcc_Wang"; Title="UniOcc"; Author="Wang"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Wang_UniOcc_A_Unified_Benchmark_for_Occupancy_Forecasting_and_Prediction_in_ICCV_2025_paper.pdf"},
    @{Name="LOcc_Yu"; Title="LOcc"; Author="Yu"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Yu_Language_Driven_Occupancy_Prediction_ICCV_2025_paper.pdf"},
    @{Name="GaussianOcc_Gan"; Title="GaussianOcc"; Author="Gan"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Gan_GaussianOcc_Fully_Self-supervised_and_Efficient_3D_Occupancy_Estimation_with_Gaussian_ICCV_2025_paper.pdf"},
    @{Name="AGO_Li"; Title="AGO"; Author="Li"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Li_AGO_Adaptive_Grounding_for_Open_World_3D_Occupancy_Prediction_ICCV_2025_paper.pdf"},
    @{Name="GaussianFlowOcc_Boeder"; Title="GaussianFlowOcc"; Author="Boeder"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Boeder_GaussianFlowOcc_Sparse_and_Weakly_Supervised_Occupancy_Estimation_using_Gaussian_ICCV_2025_paper.pdf"},
    @{Name="GaussRender_Chambon"; Title="GaussRender"; Author="Chambon"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Chambon_GaussRender_Learning_3D_Occupancy_with_Gaussian_Rendering_ICCV_2025_paper.pdf"},
    @{Name="ALOcc_Chen"; Title="ALOcc"; Author="Chen"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Chen_ALOcc_Adaptive_Lifting-based_3D_Semantic_Occupancy_and_Cost_Volume-based_Flow_ICCV_2025_paper.pdf"},
    @{Name="RIOcc_Fan"; Title="RIOcc"; Author="Fan"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Fan_RIOcc_Efficient_Cross-Modal_Fusion_Transformer_with_Collaborative_Feature_Refinement_ICCV_2025_paper.pdf"},
    @{Name="EmbodiedOcc_Wu"; Title="EmbodiedOcc"; Author="Wu"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Wu_EmbodiedOcc_Embodied_3D_Occupancy_Prediction_for_Vision-based_Online_Scene_ICCV_2025_paper.pdf"},
    @{Name="MCOP_Lin"; Title="MCOP"; Author="Lin"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Lin_MCOP_Multi-UAV_Collaborative_Occupancy_Prediction_ICCV_2025_paper.pdf"},
    @{Name="GA-MonoSSC_Li"; Title="GA-MonoSSC"; Author="Li"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Li_Global-Aware_Monocular_Semantic_Scene_Completion_with_State_Space_Models_ICCV_2025_paper.pdf"},
    @{Name="MonoMRN_Wang"; Title="MonoMRN"; Author="Wang"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Wang_Monocular_Semantic_Scene_Completion_via_Masked_Recurrent_Networks_ICCV_2025_paper.pdf"},
    @{Name="SceneDINO_Jevtic"; Title="SceneDINO"; Author="Jevtic"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Jevtic_Feed-Forward_SceneDINO_for_Unsupervised_Semantic_Scene_Completion_ICCV_2025_paper.pdf"},
    @{Name="DISC_Liu"; Title="DISC"; Author="Liu"; Url="https://openaccess.thecvf.com/content/ICCV2025/papers/Liu_Disentangling_Instance_and_Scene_Contexts_for_3D_Semantic_Scene_Completion_ICCV_2025_paper.pdf"}
)

foreach ($p in $papers) {
    $dir = Join-Path $baseDir $p.Name
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    $outFile = Join-Path $dir "$($p.Title)_ICCV2025.pdf"
    if (!(Test-Path $outFile)) {
        try {
            Write-Host "Downloading $($p.Title)..."
            Invoke-WebRequest -Uri $p.Url -OutFile $outFile -UseBasicParsing -TimeoutSec 60
            Write-Host "  OK: $outFile"
        } catch {
            Write-Host "  FAIL: $($_.Exception.Message)"
        }
    } else {
        Write-Host "Skip (exists): $($p.Title)"
    }
}
