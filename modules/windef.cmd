@echo off
echo.
echo.
echo Restoring Windows Defender To Default Settings
echo.
MpCmdRun.exe -RestoreDefaults
echo.
echo Updating Windows Defender
echo.
MpCmdRun.exe -SignatureUpdate
echo.
echo.
echo "Operation Executed"
goto :menu
