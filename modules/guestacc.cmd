@echo off
echo.
net user guest /active:no
echo.
echo Operation Executed!
echo.
cd ..
call "framework.cmd"
