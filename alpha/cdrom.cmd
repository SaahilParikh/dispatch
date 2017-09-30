::Restrict CD ROM drive
echo.
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateCDRoms /t REG_DWORD /d 1 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo.
