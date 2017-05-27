@echo off
REM stig ID V-63809
REM If this option is enabled, the Recovery Console does not require a password and automatically logs on to the system. This could allow unauthorized administrative access to the system.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\" /v SecurityLevel /t REG_DWORD /d 0 /f
echo executed
goto :menu
