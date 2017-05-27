@echo off
REM Stig ID: V-63651
REM Remote assistance allows another user to view or take control of the local session of a user.
REM Solicited assistance is help that is specifically requested by the local user.
REM This may allow unauthorized parties access to the resources on the computer.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
goto :menu
