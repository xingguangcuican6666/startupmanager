::Author:example
::ModID
::tips:ʾ��ģ��
set temp_config=C:\startupmanager\temp\config\
:��ʼ������
call %temp_config%\mod_ModID_config.bat
:��ȡ����
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
::��������
call 
if "%mod_ModID%" == "1" (
goto start
) else (
	rename %0 %0.d
)
goto EOF
::�ж������ļ��Ƿ�����mod
:start
::����ʵ�ֵĹ���


:EOF
::��������