@setlocal enableextensions enabledelayedexpansion
@echo off

:ini
:: ==============================
:: ==============================
:: Set Window Size
mode con: cols=95 lines=78
:: Set The Title
title Win-Sec
::
echo.
echo.
echo Win-Sec
echo.
echo.
echo.
echo Automatic Windows Framework Hardening Script
echo By Goerick
echo Wando Cyber Patriot
:check
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    goto :yes
) ELSE (
    goto :no
)

:yes
cd %~dp0
echo You Are Running This With Administrative Privilages
goto :internet
:no
cd %~dp0
echo You Are Not Running This With Administrative Privilages
echo Errors And Critical Bugs May Occur
goto :internet

:internet
echo Checking If You Have Internet Connection...
ping google.com | FIND "Reply from " > NUL
IF NOT ERRORLEVEL 1 goto :yesi
IF ERRORLEVEL 1 goto :noi
goto :error

:yesi
echo You Have Internet Connection
goto :load
:noi
echo No Internet Connection
goto :load



:load
:: Show The Modules Scripts Loaded
echo MODULES LOADED:
cd %~dp0modules
dir /b /a-d
echo.
:: Show Stigs Scripts Loaded
echo STIGS LOADED:
cd %~dp0stigs
dir /b /a-d
echo.
echo.
:: Show API Scripts Loaded
echo API LOADED:
cd %~dp0api
dir /b /a-d
echo.

:: Initial Messages:
echo Logged In As User %USERNAME%
echo Type 'help' For Commands
echo Remember To Restart The Computer To Make Changes
echo.
goto :menu


:menu :: The Main Framework aka Menu Terminal

:: Set Directory
cd %~dp0
:: Set Input
set "INPUT="
set /P INPUT=%USERNAME%@Win-Sec:~$
if /I "%INPUT%" EQU "help" goto :help

:: MENU Commands ==================================================

:: Check For Invalid Commands, currently this is bugged so going to add once it is fixed
::
::setlocal enableDelayedExpansion
::echo(!INPUT!|findstr /rx "D[0123456789]*" >nul && (
::  goto :command
::) || (
::  echo Unknown Command
:: )

:command
:: For Executing Filename via call
:: I could have just done with dir then variable, but this is an addon for later incase if I want to implement sub commands
FOR /F "tokens=* USEBACKQ" %%F IN (`@echo %INPUT%.cmd`) DO (
SET F=%%F
)

:: See If It Exists
cd %~dp0modules
dir /s/b %F% > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0modules
    call %F%
      cd :menu
) ELSE (
  goto :stigs
)

:stigs
cd %~dp0stigs
dir /s/b %F% > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0\stigs
    call %F%
      cd :menu
) ELSE (
  goto :api
)

:api
cd %~dp0api
dir /s/b %F% > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0api
    call %F%
      cd :menu
) ELSE (
  goto :nocommand
)

:: Incase if one of the plugins is missing goto :menu
goto :menu




:: Incase The Above Fails
:: Purely For Bug Testing
:criticalerror
echo.
echo Warning
echo A critical error has occured
echo.

:: Class For Unknown Commands
:nocommand
echo "Unknown Command"
goto :menu

:: Help Command
:help
echo.
echo.
echo Modules
:: List Modules
for /R %~dp0modules %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo Stigs
:: List Stigs
for /R %~dp0stigs %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo API
:: List API
for /R %~dp0api %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo.
echo.
:: Go Back
goto :menu
