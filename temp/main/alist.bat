@echo on
::main
::set home=C:\startupmanager
echo [%date% %time%] I:Æô¶¯£¡ >> %home%\logs\mod_alist.log
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit


:begin
call C:\startupmanager\temp\config\mod_alist_config.bat
if "%mod_alist%" == "1" (
goto en 
) else (
	rename %0 %0.d
goto EOF
)
:en
D:
cd D:\alist
alist server >> %home%\logs\mod_alist.log
pause
:EOF
pause