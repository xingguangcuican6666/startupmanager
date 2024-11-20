
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""C:\startupmanager\project\kmsoffice\¼¤»î.bat"" h",0)(window.close)&&exit


:begin
if "%office_kms%" == "1" (
	cd "C:\Program Files\Microsoft Office\Office16\"
	cscript ospp.vbs /act	
	cd %home%
)