@echo on
::main
echo [%date% %time%] I:启动！ >> %home%\logs\mod_autobackup.log
:en
for /f "tokens=1-4 delims=/ " %%i in ('date /t') do (
    set year=2024
    set month=%%j
    set day=%%k
)
if exist "D:\backups\10班共享资料-%year%.%month%.%day%-autopack.7z" (
	echo [%date% %time%] W:文件存在，跳过！ >> %home%\logs\mod_autobackup.log
	goto EOF
)

if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit


:begin
call C:\startupmanager\temp\config\mod_autobackup_config.bat
if "%mod_autobackup%" == "1" (
goto en 
) else (
	rename %0 %0.d
goto EOF
)
:en
for /f "tokens=1-4 delims=/ " %%i in ('date /t') do (
    set year=2024
    set month=%%j
    set day=%%k
)
:: 获取七天前的日期
:: 将日期格式化为 YYYY-MM-DD
set data=%year%-%month%-%day%

:: 执行 PowerShell 脚本来计算七天前的日期并格式化
for /f %%a in ('powershell -Command "([DateTime]::ParseExact('%data%', 'yyyy-M-d', $null).AddDays(-7)).ToString('yyyy.MM.dd')"') do set result=%%a

:: 输出七天前的日期
echo [%date% %time%] I:开始备份！ >> %home%\logs\mod_autobackup.log

del /s /q D:\backups\10班共享资料-%year%.%month%.%day%-autopack.7z

set filename=D:\backups\10班共享资料-%year%.%month%.%day%-autopack.7z
echo [%date% %time%] I:文件名"%filename%" >> %home%\logs\mod_autobackup.log
7z a -t7z -m0=lzma2 -mx9 -mfb=64 -md=32m -ms=on %filename% "D:\10班共享资料"

echo [%date% %time%] I:完成 >> %home%\logs\mod_autobackup.log
del /s /q D:\backups\10班共享资料-%result%-autopack.7z

:EOF