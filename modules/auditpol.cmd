@echo off
echo.
echo Setting Audit Logging Policy
echo.
echo.
echo.
echo "==================================="
Auditpol /set /category:"Account Logon" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"Logon/Logoff" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"Account Management" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"DS Access" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"Object Access" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"policy change" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"Privilege use" /Success:enable /failure:enable
echo "==================================="
Auditpol /set /category:"System" /Success:enable /failure:enable
echo "==================================="
echo.
echo.
echo.
echo Setting Audit Password Policy
echo.
echo.
echo.
echo "==================================="
net accounts /minpwlen:8
echo "==================================="
net accounts /maxpwage:30
echo "==================================="
net accounts /uniquepw:0
echo "==================================="
net accounts /minpwage:10
echo "==================================="
net accounts /maxpwage:90
echo "==================================="
net accounts /forcelogoff:60
echo "==================================="
net accounts /lockoutthreshold:4
echo "==================================="
net accounts /lockoutwindow:4
echo "==================================="
net accounts /lockoutduration:4
echo "==================================="
echo.
echo.
echo.
echo "Operation Executed. Make Sure To See For Errors"
cd ..
call "framework.cmd"
