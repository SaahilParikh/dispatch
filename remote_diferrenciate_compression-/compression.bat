@echo off
ocsetup MSRDC-Infrastructure /uninstall
product where name="MSRDC-Infrastructure" call uninstall
sc delete MSRDC-Infrastructure
@echo Uninstalling Remote Differential Compression
pause 
