@echo off
echo.
echo.
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\CurrentVersion\Policies\System" /f /v DisableCAD /t REG_WORD /d 1 /f
echo.
echo Operation Executed
