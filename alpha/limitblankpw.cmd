::Limit use of blank passwords
echo.
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo.
