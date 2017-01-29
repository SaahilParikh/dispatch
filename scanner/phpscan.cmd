@echo off
echo.
echo Scanning...
echo WARNING This May Take Awhile!
cd C:\
dir /b /s *.php *.php1 *.phtml > %~dp0\scanner\result\php.txt
echo Scan Complete!
echo Check The result subdirectory
echo.
cd ..
echo Results Saved In %~dp0\result
echo.
cd %~dp0
call "framework.cmd"
