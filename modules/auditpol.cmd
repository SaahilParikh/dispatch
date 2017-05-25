@echo off
echo.
echo Setting Audit Logging Policy
echo.
echo.
echo.
echo "Setting Account Logon"
Auditpol /set /category:"Account Logon" /Success:enable /failure:enable
echo "Setting Logging Logon/Logoff"
Auditpol /set /category:"Logon/Logoff" /Success:enable /failure:enable
echo "Setting Account Management"
Auditpol /set /category:"Account Management" /Success:enable /failure:enable
echo "Setting DS Access"
Auditpol /set /category:"DS Access" /Success:enable /failure:enable
echo "Setting Object Access"
Auditpol /set /category:"Object Access" /Success:enable /failure:enable
echo "Setting Policy Change"
Auditpol /set /category:"policy change" /Success:enable /failure:enable
echo "Setting Privilage Use"
Auditpol /set /category:"Privilege use" /Success:enable /failure:enable
echo "Setting System"
Auditpol /set /category:"System" /Success:enable /failure:enable
echo.
echo.
echo.
echo Setting Audit Password Policy
echo.
echo.
echo.
echo "Setting Minimum Password Length (8)"
net accounts /minpwlen:8
echo "Setting Max Password Length (30)"
net accounts /maxpwage:30
echo "Setting Unique Password (0)"
net accounts /uniquepw:0
echo "Setting Minimum Password Age (10)"
net accounts /minpwage:10
echo "Setting Max Password Age (30)"
net accounts /maxpwage:30
echo "Setting Force Logoff (60)"
net accounts /forcelogoff:60
echo "Setting Lock Out Threshold (4)"
net accounts /lockoutthreshold:4
echo "Setting Lockout Window (4)"
net accounts /lockoutwindow:4
echo "Setting Lock Out Duration (4)"
net accounts /lockoutduration:4
echo.
echo.
echo.
echo.
echo.
echo "Operation Executed. Make Sure To See For Errors"
echo "Click Any Keys To Continue"
pause > NUL
cd ..
call "framework.cmd"
