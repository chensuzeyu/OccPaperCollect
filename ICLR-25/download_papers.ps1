# ICLR 2025 Occupancy & Scene Completion Papers Download Script
# PDF 从 OpenReview 下载，需使用 Python openreview 客户端（因需认证/API）

$baseDir = "D:\develop\OccPaperCollect\ICLR-25\papers"
$indexPath = "D:\develop\OccPaperCollect\ICLR-25\paper_index.json"

if (!(Test-Path $indexPath)) {
    Write-Host "请先运行: python fetch_iclr25.py"
    exit 1
}

$index = Get-Content $indexPath -Raw | ConvertFrom-Json
foreach ($p in $index) {
    $dir = Join-Path $baseDir $p.dir_name
    $pdfFile = Join-Path $dir "$($p.short_title)_ICLR2025.pdf"
    if (Test-Path $pdfFile) {
        Write-Host "Skip (exists): $($p.short_title)"
        continue
    }
    # OpenReview PDF: https://openreview.net/pdf?id={forum_id}
    $forumId = $p.openreview_url -replace '.*\?id=', ''
    $pdfUrl = "https://openreview.net/pdf?id=$forumId"
    try {
        Write-Host "Downloading $($p.short_title)..."
        Invoke-WebRequest -Uri $pdfUrl -OutFile $pdfFile -UseBasicParsing -TimeoutSec 90
        Write-Host "  OK: $pdfFile"
        # 更新 metadata.json 的 local_pdf
        $metaPath = Join-Path $dir "metadata.json"
        if (Test-Path $metaPath) {
            $meta = Get-Content $metaPath -Raw -Encoding UTF8 | ConvertFrom-Json
            $meta.local_pdf = "$($p.short_title)_ICLR2025.pdf"
            $meta | ConvertTo-Json -Depth 10 | Set-Content $metaPath -Encoding UTF8 -NoNewline
        }
    } catch {
        Write-Host "  FAIL: $($p.short_title) - $($_.Exception.Message)"
    }
}
