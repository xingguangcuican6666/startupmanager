@echo off
echo ������...
7z a -t7z -m0=lzma2 -mx9 -mfb=64 -md=32m -ms=on D:\startmanager-backups.7z %home%\* >nul
echo ��ʼOTA����...
7z x "%temp%\update.zip" -o"%home%\" -y > nul

:: ��� 7z �����Ƿ�ɹ�
if %ERRORLEVEL% neq 0 (
    echo Extraction failed with exit code %ERRORLEVEL%.
    powershell Write-Host "����ʧ�ܣ�����" -ForegroundColor Red
    del /s /q %home%
    7z x "D:\startmanager-backups.7z" -o"%home%\" -y > nul
    start cmd /c %home%\bin\ϵͳ���߳�ʼ��.bat
exit
) else (
    echo Extraction succeeded.
    start cmd /c %home%\bin\ϵͳ���߳�ʼ��.bat
exit
)