@echo off
REM stig ID V-63347
REM Basic authentication uses plain text passwords that could be used to compromise a system.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\" /v AllowBasic /t REG_DWORD /d 0 /f
REM stig ID V-63335
REM Basic authentication uses plain text passwords that could be used to compromise a system.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\" /v AllowBasic /t REG_DWORD /d 0 /f
echo executed
goto :menu
