@echo off
..\bin\wget.exe --no-check-certificate -v -O sliksvn.msi "http://www.sliksvn.com/pub/Slik-Subversion-1.7.4-win32.msi"
msiexec /a sliksvn.msi /qn TARGETDIR=%~dp0temp
if exist ..\bin\SlikSvn rd /S /Q ..\bin\SlikSvn
xcopy /Y /S /Q .\temp\SlikSvn ..\bin\SlikSvn\
rd /S /Q .\temp
del sliksvn.msi
pause