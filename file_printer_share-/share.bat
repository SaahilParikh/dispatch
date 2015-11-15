@echo off
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Noog
product where name="File and Printer Sharing" call uninstall
REG add "HKLM\SYSTEM\CurrentControlSet\services\File and Printer Sharing" /v Start /t REG_DWORD /d 4 /f
echo -
echo -
echo if failed go to task manager and force shut off then run again
pause
