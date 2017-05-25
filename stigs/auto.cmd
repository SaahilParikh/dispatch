@echo off
echo Doing Stig ID V-63667...
REM Autoplay must be turned off for non-volume devices.
REM Allowing autoplay to execute may introduce malicious code to a system. 
REM Autoplay begins reading from a drive as soon as you insert media in the drive. As a result, the setup file of programs or music on audio media may start. 
REM This setting will disable autoplay for non-volume devices (such as Media Transfer Protocol (MTP) devices).

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer\" /v NoAutoplayfornonVolume /t REG_DWORD /d 1


echo Doing Stig ID V-63673...
REM Autoplay must be disabled for all drives.
REM Allowing autoplay to execute may introduce malicious code to a system. 
REM Autoplay begins reading from a drive as soon as you insert media in the drive. 
REM As a result, the setup file of programs or music on audio media may start. 
REM By default, autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives. 
REM If you enable this policy, you can also disable autoplay on all drives.

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\" /v NoDriveTypeAutoRun /t REG_DWORD /d 255


echo Doing Stig ID V-63671...
REM The default autorun behavior must be configured to prevent autorun commands.
REM Allowing autorun commands to execute may introduce malicious code to a system. 
REM Configuring this setting prevents autorun commands from executing.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer\" /v NoAutorun /t REG_DWORD /d 1

cd ..
call "framework.cmd"
