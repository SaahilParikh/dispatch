@echo off
net stop RemoteRegistry
product where name="RemoteRegistry" call uninstall
sc delete RemoteRegistry
REG add "HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 4 /f
echo -
echo -
echo if failed go to task manager and force shut off then run again
pause