@echo off
net stop RpcLocator
product where name="RpcLocator" call uninstall
sc delete RpcLocator
REG add "HKLM\SYSTEM\CurrentControlSet\services\RpcLocator" /v Start /t REG_DWORD /d 4 /f
echo Operation Executed
