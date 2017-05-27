@echo off
echo.
echo Stopping Server...
echo.
net stop server
echo.
echo Configuring...
echo.
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
echo Finished!
echo Starting Server...
net start server
echo.
echo Operation Executed
echo.
goto :menu
