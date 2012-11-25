@echo off
..\bin\wget.exe --no-check-certificate -v -O thg.msi "http://bitbucket.org/tortoisehg/files/downloads/tortoisehg-2.6.0-hg-2.4-x86.msi"
msiexec /a thg.msi /qn TARGETDIR=%~dp0temp
if exist ..\bin\TortoiseHg rd /S /Q ..\bin\TortoiseHg
xcopy /Y /S /Q .\temp\PFiles\TortoiseHg ..\bin\TortoiseHg\
rd /S /Q .\temp
del thg.msi
pause