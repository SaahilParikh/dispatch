@echo off
REM stig ID V-68849
REM Attackers are constantly looking for vulnerabilities in systems and applications. Structured Exception Handling Overwrite Protection (SEHOP) blocks exploits that use the Structured Exception Handling overwrite technique, a common buffer overflow attack.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\" /v DisableExceptionChainValidation /t REG_DWORD /d 0 /f
echo executed
goto :menu
