@setlocal enableextensions enabledelayedexpansion
@echo off



REM ==============================
REM Initialize Multicolor
REM Multicolor Feature
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & call echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
<nul > X set /p ".=."

goto :ini
REM Did this so :color can be isolated

REM color class
:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
exit /b



:ini
REM ==============================
REM Set Window Size
mode con: cols=95 lines=78
title Win-Sec

REM Show The Modules Scripts Loaded
echo MODULES LOADED:
cd %~dp0modules
dir /b /a-d
echo.
REM Show Stigs Scripts Loaded
echo STIGS LOADED:
cd %~dp0stigs
dir /b /a-d
echo.
echo.
echo API LOADED:
cd %~dp0api
dir /b /a-d
echo.

REM Initial Messages:

call :color 0c "Remember To Restart The Computer To Make Changes"
echo.
call :color 03 "Logged In As User "
call :color 0B "%USERNAME% "
call echo.
call :color 04 "Type 'help' For Commands"
echo.
goto :menu


REM The Main Framework aka Menu Terminal
:menu
REM Set Directory
cd %~dp0
REM Set Input

set "INPUT="
set /P INPUT=%USERNAME%@Win-Sec:~$

if /I "%INPUT%" EQU "help" goto :help

REM MENU Commands ==================================================

REM Check For Invalid Commands, currently this is bugged so going to add once it is fixed
::
::setlocal enableDelayedExpansion
::echo(!INPUT!|findstr /rx "D[0123456789]*" >nul && (
::  goto :command
::) || (
::  echo Unknown Command
:: )

:command
REM For Executing Filename via call
REM I could have just done with dir then variable, but this is an addon for later incase if I want to implement sub commands
FOR /F "tokens=* USEBACKQ" %%F IN (`@echo %INPUT%.cmd`) DO (
SET F=%%F
)

REM See If It Exists
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
    cd %~dp0\tigs
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
    cd api
    call %F%
      cd :menu
) ELSE (
  goto :nocommand
)

REM Incase if one of the plugins is missing goto :menu
goto :menu




REM Incase The Above Fails
REM Purely For Bug Testing
:criticalerror
echo.
echo "Warning"
echo "A critical error has occured"
echo "Please report the findings on github"
echo.


REM Class For Unknown Commands
:nocommand
echo "Unknown Command"
goto :menu


REM Help Command

:help
REM List Modules

for /R %~dp0modules %%f in (*.cmd) do (
echo %%~nf
)



REM List Stigs

for /R %~dp0stigs %%f in (*.cmd) do (
echo %%~nf
)



REM List API

for /R %~dp0api %%f in (*.cmd) do (
echo %%~nf
)

goto :menu
