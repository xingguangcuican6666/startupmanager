::Debug swich
@echo off
::����ui
set home="C:\startupmanager"
::if "%1" == "h" goto begin
::mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
::cd "C:\Program Files\startupmanager\bin"
::main
color e
::����

echo Startupmanager by xingguangcuican
echo [...]����
del /s /q C:\startupmanager\temp
rd /s /q C:\startupmanager\temp
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
call %home%\updater.bat

::��������
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [...]��������
call C:\startupmanager\config.bat

::����mod
mkdir C:\startupmanager\temp
7z.exe x C:\startupmanager\mod\*.zip -o"C:\startupmanager\temp\"
cd C:\startupmanager\temp\config
for %%f in (C:\startupmanager\temp\config\*.bat) do (
    call "%%f"
)
cd %home%
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������
::ִ�й���
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������

echo [...]ִ�й��� 1/3
if "%cleanedge%" == "1" (
	timeout 0
	taskkill /f /im msedge.exe
)
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������

echo [...]ִ�й��� 2/3
if "%gptserver%" == "1" (
	hidden.vbs "C:\startupmanager\project\chatgpt\start.bat.lnk"
	hidden.vbs "C:\startupmanager\project\chatgpt\start.cmd.lnk"
)
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������
echo [...]ִ�й��� 3/3


cls
if exist "%home%\lerror.log" (
	goto ETG
)
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������

echo [��]ִ�й��� 3/3
echo [��]modLoader����
cd C:\startupmanager\temp\main
for %%f in (C:\startupmanager\temp\config\*.bat) do (
    echo ["%%f"]mod��ʼ���ɹ�
    call "%%f"
)
for %%f in (C:\startupmanager\temp\main\call\*.bat) do (
    echo ["%%f"]mod����ɹ�
    call "%%f"
)
for %%f in (C:\startupmanager\temp\main\*.bat) do (
    echo ["%%f"]mod����ɹ�
    %home%\hidden.vbs "%%f"
)
cd %home%
if %errorlevel% neq 0 (
    echo The command failed with errorlevel %errorlevel%.
    echo. > %home%\lerror.log
)
goto EOF
:ETG
cls
echo Startupmanager by xingguangcuican
echo [��]����
echo ������
echo �޸���
echo [��]��������

echo [��]ִ�й��� 3/3
powershell Write-Host "[/]modLoader����	����	ԭ��:��һ�γ��ִ���Ϊ�˰�ȫ�����β�����mod" -ForegroundColor Red
echo.
echo ======================================
echo ������־:
powershell cat %home%\lerror.log
powershell cat %home%\logs\temp.log
echo ======================================
pause
del /s /q %home%\lerror.log
:EOF
timeout 2

