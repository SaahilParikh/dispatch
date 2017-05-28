@echo off
echo.
echo enabling firewall...
netsh advfirewall set currentprofile state on
netsh advfirewall set privateprofile state on
netsh advfirewall set domainprofile state on
netsh advfirewall set publicprofile state on
REM Just incase if it doesn't work
netsh advfirewall set allprofiles state on
echo.
echo Operation Executed
