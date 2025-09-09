@echo off
set "YTDLP=C:\Musicas Download\yt-dlp.exe"

REM === O CAMINHO RELATIVO QUE APONTA PARA A SUA PASTA MUSIC ===
set "OUTPUT=%~dp0Music"

REM === CREATE OUTPUT FOLDER IF NOT EXISTS ===
if not exist "%OUTPUT%" mkdir "%OUTPUT%"

REM === ASK FOR PLAYLIST LINK ===
set /p PLAYLIST=Cole o link da sua playlist do YouTube:

REM === DOWNLOAD & CONVERT TO MP3 ===
"%YTDLP%" -x --audio-format mp3 --yes-playlist -o "%OUTPUT%\%%(title)s.%%(ext)s" "%PLAYLIST%"

echo.
echo ✅ Todas as músicas foram baixadas para: %OUTPUT%
pause