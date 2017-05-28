@echo off
echo.
echo Stopping Server...
net stop server
echo Configuring...
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
echo Finished!
echo Starting Server...
net start server
echo Operation Executed
