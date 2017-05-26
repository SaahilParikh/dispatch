@echo off
REM Stig ID: V-63325
REM Desc: Standard user accounts must not be granted elevated privileges.
REM Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v AlwaysInstallElevated /t REG_DWORD /d 0 /f

cd ..
call "framework.cmd"
