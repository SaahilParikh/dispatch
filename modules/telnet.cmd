@echo off
echo.
echo "Disabling Telnet"
net stop telnet
sc config tlntsvr start= disabled

::Experimental
start /w pkgmgr /uu:TelnetClient
start /w pkgmgr /uu:TelnetServer
::


sc delete telnet
