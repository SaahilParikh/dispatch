@echo off
echo.
echo Enabling firewall...
echo.
echo set currentprofile state on 
netsh advfirewall set currentprofile state on > NUL
echo.
echo set currentprofile state on 
netsh advfirewall set privateprofile state on
echo.
echo set domainprofile state on
netsh advfirewall set domainprofile state on
echo.
echo advfirewall set publicprofile state on
netsh advfirewall set publicprofile state on
echo.
:: Just incase if it doesn't work
echo. 
echo set allprofiles state on
netsh advfirewall set allprofiles state on
echo.
echo Operation Executed
echo.
