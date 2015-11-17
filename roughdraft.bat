@echo off
title Win-Sec

REM initial choice
:initial
set /P initial=Do You Want To Begin [Y/N]?
if /I "%initial%" EQU "Y" goto :start
if /I "%initial%" EQU "N" goto :exit
goto :initial

REM stopped service
:exit
echo The Operation Was Successfully Stoppped!
pause
exit

REM firewall ===========================================================================================================
:start

:firewalli
set /P firewall1=Do You Want To Configure Firewall [Y/N]?
if /I "%firewall1%" EQU "Y" goto :firewall1i
if /I "%firewall1%" EQU "N" goto :windefi
pause
goto :firewalli


:firewall1i
set /P firewall2=Do You Want To Firewall=Enable On All User Profiles [Y/N]?
if /I "%firewall2%" EQU "Y" goto :firewall1
if /I "%firewall2%" EQU "N" goto :firewall2i 
pause
goto :firewall1i

:firewall1
netsh advfirewall set publicprofile state on
pause
goto :firewall2i

:firewall2i
set /P firewall3=Do You Want To Firewall=Enable On Domain Profile [Y/N]?
if /I "%firewall3%" EQU "Y" goto :firewall2
if /I "%firewall3%" EQU "N" goto :firewall3i
pause
goto :firewall2i

:firewall2
netsh advfirewall set domainprofile state on
pause
goto :firewall3i

:firewall3i
set /P firewall4=Do You Want To Firewall=Enable On Private Profiles [Y/N]?
if /I "%firewall4%" EQU "Y" goto firewall3
if /I "%firewall4%" EQU "N" goto :firewallf
pause
goto :firewall3i

:firewall3
netsh advfirewall set privateprofile state on
pause
goto :firewallf

:firewallf
echo firewall configuration finished!
pause
goto :windefi

REM windef ===========================================================================================================

:windefi
set /P windef=Do You Want To Change The Current Winows Defender Settings [Y/N]?
if /I "%windef%" EQU "Y" goto :windef1i
if /I "%windef%" EQU "N" goto :telneti
goto :windefi

:windef1i
set /P windef1=Do You Want To Enable Windows defender? [Y/N]?
if /I "%windef1%" EQU "Y" goto :windef1
if /I "%windef1%" EQU "N" goto :windef2i
goto :windef1i

:windef1
cd C:\Program Files\Windows Defender
MpCmdRun.exe -RestoreDefaults
pause
goto :windef2i

:windef2i
set /P windef2=Do You Want To Update Your Windows Defenders? [Y/N]?
if /I "%windef2%" EQU "Y" goto :windef2
if /I "%windef2%" EQU "N" goto :windef3i
goto :windef2i

:windef2
cd C:\Program Files\Windows Defender
MpCmdRun.exe -SignatureUpdate
pause
goto :windef3i

:windef3i
set /P windef2=Do You Want To Scan Your Computer [Y/N]?
if /I "%windef3%" EQU "Y" goto :windef3
if /I "%windef3%" EQU "N" goto :telneti
goto :windef3i

:windef3
echo 0=default, 1=quick scan, 2=full scan.
set /P windefscan=Pick Scan Option [0][1][2]?
cd C:\Program Files\Windows Defender
MpCmdRun.exe -Scan -%windefscan%
pause
goto :telneti




REM telnet ===========================================================================================================
:telneti
set /P ap=Do You Want To Change Current Telnet Configuration [Y/N]?
if /I "%ap%" EQU "Y" goto :telnet
if /I "%ap%" EQU "N" goto :passwordintro
goto :telneti
:telnet
echo disabling telnet...
net stop telnet
sc config tlntsvr start= disabled
echo press any keys to continue...
pause
goto :passwordintro

REM password ===========================================================================================================

:passwordintro
echo Checking Account Password Setting. Press a Key to Continue...
pause
goto :password

:password
set /P ap=Do You Want To Change Account Password Setting [Y/N]?
if /I "%ap%" EQU "Y" goto :password1i
if /I "%ap%" EQU "N" goto :port_blocki
pause
goto :password

:password1i
set /P ap1=Do You Want To Change Minimum Password Limit [Y/N]?
if /I "%ap1%" EQU "Y" goto :password1
if /I "%ap1%" EQU "N" goto :password2i
pause
goto :password1i

:password1
set /P ap2=Type In Your Limit (numerical, reccomend 8).
net accounts /minpwlen:%ap2%
pause 
goto :password2i

:password2i
set /P ap3=Do You Want To Change Maximum Password Limit [Y/N]?
if /I "%ap3%" EQU "Y" goto :password2
if /I "%ap3%" EQU "N" goto :password3i
pause
goto :password2i

:password2
set /P ap4=Type In Your Max (numerical).
net accounts /maxplen:%ap4%
pause
goto :password2

:password3i
set /P ap5=Do You Want To Configure Passwords  Being Reusable [Y/N]?
if /I "%ap5%" EQU "Y" goto :password3
if /I "%ap5%" EQU "N" goto :password4i
pause
goto :password3i


:password3
set /P ap6=Type In Your Max Amount of Reusible Password (numerical, recommend 0).
net accounts /uniquepw:%ap6%
pause
goto :password4i

:password4i
set /P ap7=Do You Want To Configure Minimum Password Age [Y/N]?
if /I "%ap7%" EQU "Y" goto :password4
if /I "%ap7%" EQU "N" goto :password5i
pause
goto :password4i

:password4
set /P ap8=Type in The Minimum Password Age.
net accounts /minpwage:%ap8%
pause
goto :password5i

:password5i
set /P ap9=Do You Want To Configure Maximum Age [Y/N]?
if /I "%ap9%" EQU "Y" goto :password5
if /I "%ap9%" EQU "N" goto :passwordc
pause
goto :password5i

:password5
set /P ap10=Type in Maximum Password Age.
net accounts /maxpwage:%ap10
pause
goto :passwordc

:passwordc
set /P apf=You Finished Password Configuration! Do You Want To Continue [Y/N]?
if /I "%apf%" EQU "Y" goto :port_blocki
if /I "%apf%" EQU "N" goto :password1i
pause


REM port block ===========================================================================================================

:port_blocki
set /P pb1=Do You Want To Configure Port Blocking [Y/N]?
if /I "%pb1%" EQU "Y" goto :port_blocki2
if /I "%pb1%" EQU "N" goto :
pause
goto :port_blocki

:port_blocki2
set /P pb2=Do You Want To Auto Configure Port Blocking or Manually [A/M]?
if /I "%pb2%" EQU "A" goto :port_block1
if /I "%pb2%" EQU "M" goto :port_block2
pause
goto :port_blocki2


:port_block1
netsh advfirewall firewall add rule name="RemoteJob" protocol=TCP
dir=out remoteport=5 action=block

netsh advfirewall firewall add rule name="RemoteJob" protocol=UDP
dir=out remoteport=5 action=block

netsh advfirewall firewall add rule name="FTP" protocol=UDP
dir=out remoteport=21 action=block

netsh advfirewall firewall add rule name="FTP" protocol=UDP
dir=out remoteport=20 action=block

netsh advfirewall firewall add rule name="Telnet" protocol=UDP
dir=out remoteport=23 action=block

netsh advfirewall firewall add rule name="Private Terminal" protocol=TCP
dir=out remoteport=57 action=block

netsh advfirewall firewall add rule name="Private Terminal" protocol=UDP
dir=out remoteport=57 action=block

netsh advfirewall firewall add rule name="RemoteJob" protocol=UDP
dir=out remoteport=77 action=block

netsh advfirewall firewall add rule name="RemoteJob" protocol=TCP
dir=out remoteport=77 action=block

netsh advfirewall firewall add rule name="Tor" protocol=TCP
dir=out remoteport=81 action=block

netsh advfirewall firewall add rule name="Tor" protocol=UDP
dir=out remoteport=82 action=block

netsh advfirewall firewall add rule name="Cybergate" protocol=UDP
dir=out remoteport=100 action=block

netsh advfirewall firewall add rule name="Telnet" protocol=TCP
dir=out remoteport=107 action=block

netsh advfirewall firewall add rule name="Telnet" protocol=UDP
dir=out remoteport=107 action=block

netsh advfirewall firewall add rule name="FTP" protocol=TCP
dir=out remoteport=115 action=block

netsh advfirewall firewall add rule name="IRC" protocal=TCP
dir=out remoteport=194 action=block

netsh advfirewall firewall add rule name="IRC" protocol=UDP
dir=out remoteport=194 action=block

netsh advfirewall firewall add rule name="RemoteProcessExecution" protocol=TCP
dir=out remoteport=512 action=block

netsh advfirewall firewall add rule name="RemoteShell" protocol=TCP
dir=out remoteport=514 action=block

netsh advfirewall firewall add rule name="RemoteProcedureCall" protocol=TCP
dir=out remoteport=530 action=block

netsh advfirewall firewall add rule name="RemoteProcedureCall" protocol=UDP
dir=out remoteport=530 action=block

netsh advfirewall firewall add rule name="RemoteIBM" protocol=TCP
dir=out remoteport=657 action=block

netsh advfirewall firewall add rule name="RemoteIBM" protocol=TCP
dir=out remoteport=544 action=block

netsh advfirewall firewall add rule name="RemoteIBM" protocol=UDP
dir=out remoteport=657 action=block

netsh advfirewall firewall add rule name="RemoteAircrack" protocol=TCP
dir=out remoteport=666 action=block

netsh advfirewall firewall add rule name="NSF" protocol=UDP
dir=out remoteport=944 action=block

netsh advfirewall firewall add rule name="IPV6FTP" protocol=UDP
dir=out remoteport=973 action=block
pause


:port_block2-1
set /P pbnick=Type In a Nickname.
set /P pbnum=Type In the Port Number
set /P pbproto=Type In the Protocal [TCP][UDP].
set /P pba=Type In the action [block].
set /P pbd=Type In the Direction [out].
goto :portblock2-2

:port_block2-2
set /P pb3=Are You Sure About The Settings? [Y/N]?
if /I "%pb3%" EQU "Y" goto :port_block2-1
if /I "%pb3%" EQU "N" goto :port_block2-3
pause
goto :port_block2-2

:port_block2-3
netsh advfirewall firewall add rule name=%pbnick% protocol=%pbproto%
dir=%pbd% remoteport=%pbnum% action=%pba%

goto :portblock2-1








:Top
@ECHO OFF
ECHO.
ECHO ---------------------------------------
SET /P UserInput=Please Enter a Number: 
ECHO.
ECHO UserInput = %UserInput%
ECHO.
SET /A Evaluated=UserInput
ECHO Math-Evaluated UserInput = %Evaluated%
if %Evaluated% EQU %UserInput% (
    ECHO Integer
    IF %UserInput% GTR 0 ( ECHO Positive )
    IF %UserInput% LSS 0 ( ECHO Negative )
    IF %UserInput% EQU 0 ( ECHO Zero )
    REM - Other Comparison operators for numbers
    REM - LEQ - Less Than or Equal To
    REM - GEQ - Greater Than or Equal To
    REM - NEQ - Not Equal To
) ELSE (
    REM - Non-numbers and decimal numbers get kicked out here
    ECHO Non-Integer
)

GOTO Top



timeout /t -1 
