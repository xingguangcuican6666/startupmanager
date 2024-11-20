::Debug swich
@echo off
::隐藏ui
set home="C:\startupmanager"
::if "%1" == "h" goto begin
::mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
::cd "C:\Program Files\startupmanager\bin"
::main
color e
::清理

echo Startupmanager by xingguangcuican
echo [...]清理
del /s /q C:\startupmanager\temp
rd /s /q C:\startupmanager\temp
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
call %home%\updater.bat

::加载配置
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [...]加载配置
call C:\startupmanager\config.bat

::加载mod
mkdir C:\startupmanager\temp
7z.exe x C:\startupmanager\mod\*.zip -o"C:\startupmanager\temp\"
cd C:\startupmanager\temp\config
for %%f in (C:\startupmanager\temp\config\*.bat) do (
    call "%%f"
)
cd %home%
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置
::执行工作
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置

echo [...]执行工作 1/3
if "%cleanedge%" == "1" (
	timeout 0
	taskkill /f /im msedge.exe
)
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置

echo [...]执行工作 2/3
if "%gptserver%" == "1" (
	hidden.vbs "C:\startupmanager\project\chatgpt\start.bat.lnk"
	hidden.vbs "C:\startupmanager\project\chatgpt\start.cmd.lnk"
)
cls
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置
echo [...]执行工作 3/3


cls
if exist "%home%\lerror.log" (
	goto ETG
)
echo Startupmanager by xingguangcuican
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置

echo [√]执行工作 3/3
echo [√]modLoader加载
cd C:\startupmanager\temp\main
for %%f in (C:\startupmanager\temp\config\*.bat) do (
    echo ["%%f"]mod初始化成功
    call "%%f"
)
for %%f in (C:\startupmanager\temp\main\call\*.bat) do (
    echo ["%%f"]mod载入成功
    call "%%f"
)
for %%f in (C:\startupmanager\temp\main\*.bat) do (
    echo ["%%f"]mod载入成功
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
echo [√]清理
echo 检查更新
echo 无更新
echo [√]加载配置

echo [√]执行工作 3/3
powershell Write-Host "[/]modLoader加载	跳过	原因:上一次出现错误，为了安全，本次不加载mod" -ForegroundColor Red
echo.
echo ======================================
echo 错误日志:
powershell cat %home%\lerror.log
powershell cat %home%\logs\temp.log
echo ======================================
pause
del /s /q %home%\lerror.log
:EOF
timeout 2

