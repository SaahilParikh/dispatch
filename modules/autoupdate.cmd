@echo off
echo.
echo.
net stop wuauserv
echo.
Stopping Service...
echo.
echo.
echo Configuring...
sc config wuauserv start= auto
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 0 /f
echo.
echo.
echo Restarting Service...
echo.
net start wuauserv
echo.
echo.
echo Operation Executed
echo.
echo.
cd ..
call "framework.cmd"
