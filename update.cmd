@echo off

::checking latest version
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/goerick/dispatch/master/version.txt -OutFile versioncheck.txt"


::Version of This Build Variable
set /p version=<version.txt
::Version of Newest Build Variable
set /p newversion=<versioncheck.txt

::Check
set newversion=%newversion: =%
if %version% lss %newversion% goto :newupdateavailable
if %version%==%newversion% goto :noupdateavailable
::Just Incase
if %version% gtr %newversion% goto :noupdateavailable



:newupdateavailable
echo An Update is Available
set /P updatec=Would You Like To Download The Update [Y/N]?
if /I "%updatec%" EQU "Y" goto :downloadupdate
if /I "%updatec%" EQU "N" goto :doneupdate
goto :newupdateavailable

:downloadupdate
::downloading new version if it exists
echo Downloading Update
cd %~dp0
powershell -Command "Invoke-WebRequest https://github.com/goerick/dispatch/archive/master.zip -OutFile master.zip"
for %i in (*) do if not %i == framework.cmd del %i
powershell -Command "expand-archive -path '%~dp0/master.zip' -destinationpath '%~dp0\unzipped'"
del framework.cmd
cd %~dp0\unzipped
move %~dp0\unzipped %~dp0
goto :doneupdate

:noupdateavailable
echo No Update Available
goto :doneupdate


:doneupdate
echo done!
pause
