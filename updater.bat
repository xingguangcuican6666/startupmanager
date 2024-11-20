curl ftp://10.165.74.12/version.txt
cls
if "%errorlevel%" neq "0" (
    echo Curl failed with exit code %errorCode%
	goto EOF
) else (
	echo 获取更新成功 >> %home%\logs\main.log
)
:: 执行 curl 命令并将输出存储到变量
for /f "delims=" %%i in ('curl ftp://10.165.74.12/version.txt') do (
    set "curlOutput=%%i"
)

:: 定义文件路径
set "filePath=%home%\version.txt"

:: 初始化变量
set "fileContent="

:: 读取文件内容
for /f "delims=" %%i in ('type "%filePath%"') do (
    set "fileContent=%%i"
)
if "%curlOutput%" == "%fileContent%" (
	goto EOF
) else (
	powershell Invoke-WebRequest -Uri ftp://10.165.74.12/dialog.log -OutFile %temp%\dialog.log
	powershell Invoke-WebRequest -Uri ftp://10.165.74.12/update.zip -OutFile %temp%\update.zip
	copy %home%\updater-later.bat %temp%\updater-later.bat
	cls
	echo 发现更新
	powershell cat %temp%\dialog.log
	echo 三秒后开始更新 & timeout 4
	start %temp%\updater-later.bat
	exit
)
:EOF