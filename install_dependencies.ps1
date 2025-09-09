# Cria a pasta 'tools' se ela não existir
if (-not (Test-Path -Path "tools")) {
    New-Item -ItemType Directory -Path "tools" | Out-Null
    Write-Host "Pasta 'tools' criada."
}

# --- Download FFmpeg ---
$ffmpegUrl = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z"
$ffmpegZipFile = "ffmpeg.7z"

Write-Host "Baixando FFmpeg..."
Invoke-WebRequest -Uri $ffmpegUrl -OutFile $ffmpegZipFile

Write-Host "Extraindo FFmpeg..."
Expand-Archive -Path $ffmpegZipFile -DestinationPath "tools" -Force

# Move os executáveis para a pasta 'tools'
$ffmpegExtractedPath = (Get-ChildItem -Path "tools" -Directory | Where-Object { $_.Name -like "ffmpeg-*" }).FullName
Move-Item -Path "$ffmpegExtractedPath\bin\ffmpeg.exe" -Destination "tools\ffmpeg.exe" -Force
Move-Item -Path "$ffmpegExtractedPath\bin\ffprobe.exe" -Destination "tools\ffprobe.exe" -Force
Remove-Item -Path $ffmpegExtractedPath -Recurse -Force
Remove-Item -Path $ffmpegZipFile -Force
Write-Host "FFmpeg e ffprobe instalados."

# --- Download yt-dlp ---
$ytDlpUrl = "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
$ytDlpFile = "tools\yt-dlp.exe"

Write-Host "Baixando yt-dlp..."
Invoke-WebRequest -Uri $ytDlpUrl -OutFile $ytDlpFile
Write-Host "yt-dlp instalado."

Write-Host "Instalação concluída com sucesso! Os arquivos estão na pasta 'tools'."
