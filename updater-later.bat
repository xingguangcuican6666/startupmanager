@echo off
echo 备份中...
7z a -t7z -m0=lzma2 -mx9 -mfb=64 -md=32m -ms=on D:\startmanager-backups.7z %home%\* >nul
echo 开始OTA更新...
7z x "%temp%\update.zip" -o"%home%\" -y > nul

:: 检查 7z 命令是否成功
if %ERRORLEVEL% neq 0 (
    echo Extraction failed with exit code %ERRORLEVEL%.
    powershell Write-Host "更新失败，回退" -ForegroundColor Red
    del /s /q %home%
    7z x "D:\startmanager-backups.7z" -o"%home%\" -y > nul
    start cmd /c %home%\bin\系统工具初始化.bat
exit
) else (
    echo Extraction succeeded.
    start cmd /c %home%\bin\系统工具初始化.bat
exit
)