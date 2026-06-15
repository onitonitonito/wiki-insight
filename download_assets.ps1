<#
.SYNOPSIS
Reads image_links.json, downloads external images, saves them in mirrored Assets folder,
and replaces image URLs in HTML presentation files with local relative paths.
.DESCRIPTION
This script is designed to run in PowerShell. It localizes external image links in 
HTML files to support offline viewing.
#>

$OutputEncoding = [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Continue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$basePath = $PSScriptRoot
$jsonPath = Join-Path $basePath "image_links.json"
$assetsPath = Join-Path $basePath "Assets"
$userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"

if (-not (Test-Path $jsonPath)) {
    Write-Host "Error: image_links.json not found." -ForegroundColor Red
    exit
}

Write-Host "Loading image links from JSON..." -ForegroundColor Cyan
$links = Get-Content $jsonPath -Encoding UTF8 -Raw | ConvertFrom-Json

# 1. Map category for HTML presentation files (excluding index*.html and files in Assets)
$fileToCat = @{}
$fileToFullPath = @{}
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html" | Where-Object {
    $_.Name -notlike "index*" -and $_.Directory.Name -ne "Assets"
}

foreach ($f in $htmlFiles) {
    $fileToCat[$f.Name] = $f.Directory.Name
    $fileToFullPath[$f.Name] = $f.FullName
}

$indexMap = @{}

foreach ($item in $links) {
    $file = $item.File
    $url = $item.Src

    # Skip if URL does not start with http
    if (-not $url.StartsWith("http")) {
        continue
    }

    if (-not $fileToCat.ContainsKey($file)) {
        Write-Host "Warning: Original document '$file' not found. Skipping." -ForegroundColor Yellow
        continue
    }

    $cat = $fileToCat[$file]
    $catAssetsPath = Join-Path $assetsPath $cat
    
    # Create directory if it doesn't exist
    if (-not (Test-Path $catAssetsPath)) {
        New-Item -ItemType Directory -Force -Path $catAssetsPath | Out-Null
    }

    # Generate sequential index per file
    if (-not $indexMap.ContainsKey($file)) {
        $indexMap[$file] = 1
    }
    $idx = $indexMap[$file]
    $indexMap[$file]++

    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file)
    
    # Extract extension
    $ext = ".jpg"
    if ($url -match '\.([a-zA-Z0-9]+)(?:[\?#]|$)') {
        $ext = "." + $matches[1]
        if ($ext.Length -gt 5) { $ext = ".jpg" }
    }
    if ($ext -notin @(".webp",".jpeg",".png",".gif",".jpg",".svg")) {
        $ext = ".jpg"
    }

    $safeFileName = "${baseName}_img${idx}${ext}"
    $localFilePath = Join-Path $catAssetsPath $safeFileName

    Write-Host "Downloading: $safeFileName"
    try {
        Invoke-WebRequest -Uri $url -OutFile $localFilePath -UserAgent $userAgent -UseBasicParsing -TimeoutSec 15
        
        # Replace image URL in HTML file (force UTF-8)
        $htmlPath = $fileToFullPath[$file]
        $htmlContent = Get-Content $htmlPath -Encoding UTF8 -Raw
        $relPath = "../Assets/$cat/$safeFileName"
        
        $escapedUrl = [regex]::Escape($url)
        $replacedContent = $htmlContent -replace "(?i)(src\s*=\s*[""'])$escapedUrl([""'])", "`${1}$relPath`${2}"
        
        if ($htmlContent -ne $replacedContent) {
            Set-Content -Path $htmlPath -Value $replacedContent -Encoding UTF8
            Write-Host "  -> Link updated in: $file" -ForegroundColor Green
        }
    } catch {
        Write-Host "  -> Failed to download: $url" -ForegroundColor Red
    }
}

Write-Host "`nAll downloads and assetization tasks completed!" -ForegroundColor Cyan
