@echo off
title Win-Sec

REM ==============================

REM Initialize Multicolor
REM Multicolor Feature
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & call echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
<nul > X set /p ".=."



REM ==============================
REM Set Window Size
mode con: cols=95 lines=78


call :color 03 "Logged In As User "
call :color 0B "%USERNAME% "
call echo.
call :color 04 "Type 'help' For Commands"
echo.
goto :menu

REM color class
:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
exit /b


:menu

REM Set Input

set "INPUT="
set /P INPUT=%USERNAME%@Win-Sec:~$

REM Framework Commands
if /I "%INPUT%" EQU "clear" goto :clear
if /I "%INPUT%" EQU "help" goto :helpmenu
if /I "%INPUT%" EQU "exit" goto :exit
if /I "%INPUT%" EQU "*" goto :unknown

REM Modules
if /I "%INPUT%" EQU "showfiles" goto :showfiles
if /I "%INPUT%" EQU "sharedaccess" goto :sharedaccess
if /I "%INPUT%" EQU "remotereg" goto :remotereg
if /I "%INPUT%" EQU "rpclocater" goto :rpclocater
if /I "%INPUT%" EQU "auditpol" goto :auditpol
if /I "%INPUT%" EQU "telnet" goto :telnet
if /I "%INPUT%" EQU "remotedesk" goto :remotedesk
if /I "%INPUT%" EQU "windef" goto :windef
if /I "%INPUT%" EQU "autoupdate" goto :autoupdate
if /I "%INPUT%" EQU "guestacc" goto :guestacc
if /I "%INPUT%" EQU "remoteusb" goto :remoteusb
if /I "%INPUT%" EQU "ctrlaltdel" goto :ctrlaltdel
if /I "%INPUT%" EQU "filesharing" goto :filesharing
if /I "%INPUT%" EQU "ftpdisable" goto :ftpdisable
if /I "%INPUT%" EQU "autoupdate" goto :autoupdate

REM Scanners
if /I "%INPUT%" EQU "phpscan" goto :phpscan
if /I "%INPUT%" EQU "mediascan" goto :mediascan

goto :menu



REM API Commands
:clear
cls
goto :menu

:unknown
echo Unknown Command
goto :menu
:exit
exit

REM Help Menu
:helpmenu
echo.
echo.
echo "== Framework Commands=="
echo "[help] Help Command"
echo "[clear] Clear The Terminal"
echo "[exit] Quit"
echo.
echo "== Modules =="
echo "[telnet] Disable Telnet"
echo "[windef] Configures and Update Windows Defender"
echo "[remotedesk] Disables Remote Desktop"
echo "[auditpol] Audit Policy Configure Command"
echo "[auditport] Audit Port Configuration Master Command"
echo "[sharedaccess] Disable Shared Access"
echo "[netaccp] Net Account Password Configuration Help Command"
echo "[showfiles] Show Hidden Folders and Files"
echo "[remotereg] Disables Remote Registry"
echo "[rpclocater] Disable Remote Procedure Call"
echo "[remoteusb] Disable Remote USB"
echo "[guestacc] Disable Guest Account"
echo "[ctrlaltdel] Disable Control Alt Delete Login"
echo "[filesharing] Disable Filesharing"
echo "[ftpdisable] Disable FTP"
echo "[autoupdate] Enable Windows Auto Update"
echo.

REM Comming Soon
REM echo "[lockoutthresh] Secure Lockout Threshold Exists"
REM echo "[servicepack] Install Windows Service Pack"
REM echo "[lanpasswd] Disable Storing LAN Password Hash"
REM echo "[remotedeskshare] Disable Remote Desktop Sharing"

echo "== Scanners =="
echo "[phpscan] Scan For PHP Files For Possible Backdoors"
echo "[mediascan] Scan For Media Files"
echo.
echo.
goto :menu



REM Load Modules
:showfiles
cd modules
call "showfiles.cmd"

:sharedaccess
cd modules
call "sharedaccess.cmd"

:remotereg
cd modules
call "remotereg.cmd"

:rpclocater
cd modules
call "rpclocater.cmd"

:auditpol
cd modules
call "auditpol.cmd"

:guestacc
cd modules
call "guestacc.cmd"

:telnet
cd modules
call "telnet.cmd"

:remotedesk
cd modules
call "remotedesk.cmd"

:windef
cd modules
call "windef.cmd"

:autoupdate
cd modules
call "autoupdate.cmd"

:guestacc
cd modules
call "guestacc.cmd"

:remoteusb
cd modules
call "remoteusb.cmd"

:ctrlaltdel
cd modules
call "ctrlaltdel.cmd"

:filesharing
cd modules
call "filesharing.cmd"

:ftpdisable
cd modules
call "ftpdisable.cmd"

:autoupdate
cd modules
call "autoupdate.cmd"

REM Load Scanners
:phpscan
cd scanners
call "phpscan.cmd"

:mediascan
cd scanners
call "mediascan.cmd"

goto :menu
:exit
exit /B
