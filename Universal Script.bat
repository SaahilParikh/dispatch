@echo off

REM initial choice
:initial
set /P c=Do You Want To Begin [Y/N]?
if /I "%c%" EQU "Y" goto :start
if /I "%c%" EQU "N" goto :exit
goto :initial

REM stopped service
:exit
echo The Operation Was Successfully Stoppped!
pause
exit


:start

echo disabling telnet...
net stop telnet
sc config tlntsvr start= disabled

pause 

echo enabling auto updates...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 0 /f
net start wuauserv
sc config wuauserv start= auto

pause

echo Checking Account Password details...
net accounts /minpwlen:8
net accounts /maxpwage:30
net accounts /uniquepw:0
net accounts /minpwage:10

pause

echo enabling default windows defender settings
cd C:\Program Files\Windows Defender
MpCmdRun.exe -RestoreDefaults

echo Click continue to update windows defender
timeout /t -1 


