@echo off
net stop WMPNetworkSvc
product where name="WMPNetworkSvc" call uninstall
sc delete WMPNetworkSvc
REG add "HKLM\SYSTEM\CurrentControlSet\services\WMPNetworkSvc" /v Start /t REG_DWORD /d 4 /f
echo -
echo -
echo if failed go to task manager and force shut off then run again
pause