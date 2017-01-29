@echo off
cd %~dp0\lgp
rd %systemroot%\System32\GroupPolicy /S /Q
secedit /configure /DB %temp%\temp.sdb /cfg "stig.inf"
mkdir %systemroot%\System32\GroupPolicy
xcopy GroupPolicy %systemroot%\System32\GroupPolicy /E /H
cd %~dp0
call framework.cmd
