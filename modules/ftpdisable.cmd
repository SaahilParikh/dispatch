
echo.
echo Checking if ftp service exists...
net stop msftpsvc >NUL
IF %ERRORLEVEL% EQU 0 goto :cont || goto :dne


:cont
sc stop "MSFtpsvc"
sc config "MSFtpsvc" start= disabled
sc delete "MSFtpsvc"
echo.
goto :doneftp

:dne 
echo Seems like mftpsvc does not exist...
goto :doneftp

:doneftp
echo Operation Executed

