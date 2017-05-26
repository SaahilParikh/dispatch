@echo off
echo Doing Stig ID V-63759...

REM Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access.
REM This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously", both of which must be blank under other requirements.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\" /v RestrictNullSessAccess /t REG_DWORD /d 1 /f


cd ..
call "framework.cmd"
