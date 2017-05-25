@echo off
REM Stig ID: V-63797
REM The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords. 
REM This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\" /v NoLMHash /t REG_DWORD /d 1
cd ..
call "framework.cmd"
