curl ftp://10.165.74.12/version.txt
cls
if "%errorlevel%" neq "0" (
    echo Curl failed with exit code %errorCode%
	goto EOF
) else (
	echo ��ȡ���³ɹ� >> %home%\logs\main.log
)
:: ִ�� curl ���������洢������
for /f "delims=" %%i in ('curl ftp://10.165.74.12/version.txt') do (
    set "curlOutput=%%i"
)

:: �����ļ�·��
set "filePath=%home%\version.txt"

:: ��ʼ������
set "fileContent="

:: ��ȡ�ļ�����
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
	echo ���ָ���
	powershell cat %temp%\dialog.log
	echo �����ʼ���� & timeout 4
	start %temp%\updater-later.bat
	exit
)
:EOF