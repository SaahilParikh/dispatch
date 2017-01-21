@echo off
echo.
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WirelessUSBManager" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WirelessUSBManager" /f
echo.
echo Operation Executed!
echo.
cd ..
call "framework.cmd"
