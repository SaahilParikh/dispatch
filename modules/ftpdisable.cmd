@echo off
echo.
echo
net stop msftpsvc
sc stop "MSFtpsvc"
sc config "MSFtpsvc" start= disabled
sc delete "MSFtpsvc"
echo.
echo Operation Executed
cd ..
echo.
call "framework.cmd"
