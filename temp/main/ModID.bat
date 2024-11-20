::Author:example
::ModID
::tips:示例模组
set temp_config=C:\startupmanager\temp\config\
:初始化变量
call %temp_config%\mod_ModID_config.bat
:读取配置
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
::隐藏运行
call 
if "%mod_ModID%" == "1" (
goto start
) else (
	rename %0 %0.d
)
goto EOF
::判断配置文件是否启用mod
:start
::你想实现的功能


:EOF
::结束运行