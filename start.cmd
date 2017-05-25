@call echo off

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


REM ----
title Win-Sec
call echo.
call echo.
call :color 0B "                                           Win-Sec V 2.8   "
call echo.
call echo.
call echo.
call :color 09 "                          Automatic Windows Framework Hardening Script "
call echo.
call :color 09 "                                             By Goerick "
call echo.
call echo.
call :color 0C "                                         Wando Cyber Patriot "
call echo.
call echo.
call :color 0A "                                      Press Any Key To Initiate "
echo.
echo.
TIMEOUT 4 > NUL

goto :check

:check
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    goto :yes
) ELSE (
    goto :no
)

call :color 1a "a"
call :color 1b "b"
call :color 1c "^!<>&| %%%%"*?"
exit /b

:yes
cd %~dp0
call echo.
call echo.
call :color 0a "                                   You Have Admin Privilages!                                       "
call echo.
call :color 0a "                                 Press Anything Key To Continue                                       "
echo.
pause > NUL

call :color 0C "                             Checking If You Have Internet Connection "
call echo.
PING google.com | FIND "Reply from " > NUL
IF NOT ERRORLEVEL 1 goto :yesi 
IF ERRORLEVEL 1 goto :noi
goto :error

:yesi
call echo.
call :color 0a "                                     You Have Internet! "
call echo.
call :color 0C "                                  Press Any Key To Continue "
call echo.
pause > NUL
cls
call "framework.cmd"
goto :error

:noi 
call :color 0C "                                    You Have No Internet "
call :color 0C "                        Please Check Why Your Internet Is Not Working "
call :color 0C "                                  Press Any Key To Continue "
pause > NUL
cls
call "framework.cmd"
goto :error



:error
call :color 0C "                              Oops... A Critical Error Has Occured "
call :color 0C "                      Exiting Program, Please Contact The Developer, Sorry"
pause > NUL
exit /B







:no
cd %~dp0
call echo.
call echo.
call echo.
call :color 0C "                                           == WARNING == "
echo.
echo.
echo.
call :color 04 "                                 You Are Not Running This Program At"
call :color 0C "                                            Admin Level! "
echo.
echo.
call :color 0E "                                            Quitting!"
echo.
call :color 0E "                                    Press Any Key To Continue"
echo.
pause > NUL
exit /B

:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
exit /b
