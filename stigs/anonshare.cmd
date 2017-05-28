@echo off
REM stig ID V-63749
REM Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\" /v RestrictAnonymous /t REG_DWORD /d 1 /f
echo executed
