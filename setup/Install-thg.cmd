@echo off
..\bin\wget.exe --no-check-certificate -v -O thg.msi "https://bitbucket.org/tortoisehg/thg/downloads/tortoisehg-2.3.1-hg-2.1.1-x86.msi"
msiexec /a thg.msi /qn TARGETDIR=%~dp0temp
if exist ..\bin\TortoiseHg rd /S /Q ..\bin\TortoiseHg
xcopy /Y /S /Q .\temp\PFiles\TortoiseHg ..\bin\TortoiseHg\
rd /S /Q .\temp
del thg.msi
pause