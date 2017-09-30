::Enable LSA protection
echo.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RunAsPPL /t REG_DWORD /d 00000001 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo.
