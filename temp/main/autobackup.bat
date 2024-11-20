@echo on
::main
echo [%date% %time%] I:������ >> %home%\logs\mod_autobackup.log
:en
for /f "tokens=1-4 delims=/ " %%i in ('date /t') do (
    set year=2024
    set month=%%j
    set day=%%k
)
if exist "D:\backups\10�๲������-%year%.%month%.%day%-autopack.7z" (
	echo [%date% %time%] W:�ļ����ڣ������� >> %home%\logs\mod_autobackup.log
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
:: ��ȡ����ǰ������
:: �����ڸ�ʽ��Ϊ YYYY-MM-DD
set data=%year%-%month%-%day%

:: ִ�� PowerShell �ű�����������ǰ�����ڲ���ʽ��
for /f %%a in ('powershell -Command "([DateTime]::ParseExact('%data%', 'yyyy-M-d', $null).AddDays(-7)).ToString('yyyy.MM.dd')"') do set result=%%a

:: �������ǰ������
echo [%date% %time%] I:��ʼ���ݣ� >> %home%\logs\mod_autobackup.log

del /s /q D:\backups\10�๲������-%year%.%month%.%day%-autopack.7z

set filename=D:\backups\10�๲������-%year%.%month%.%day%-autopack.7z
echo [%date% %time%] I:�ļ���"%filename%" >> %home%\logs\mod_autobackup.log
7z a -t7z -m0=lzma2 -mx9 -mfb=64 -md=32m -ms=on %filename% "D:\10�๲������"

echo [%date% %time%] I:��� >> %home%\logs\mod_autobackup.log
del /s /q D:\backups\10�๲������-%result%-autopack.7z

:EOF