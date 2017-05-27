@echo off
:help
REM List Modules
cd %~dp0
cd ..
for /R \modules %%f in (*.cmd) do (
echo %%~nf
)



REM List Stigs
cd %~dp0
cd ..
for /R \stigs %%f in (*.cmd) do (
echo %%~nf
)



REM List API
cd %~dp0
cd ..
for /R %~dp0\ %%f in (*.cmd) do (
echo %%~nf
)

goto :menu
