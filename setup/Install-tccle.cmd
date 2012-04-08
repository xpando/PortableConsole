@echo off
..\bin\wget.exe --no-check-certificate -v "http://jpsoft.com/downloads/v13/tccle.exe"
tccle.exe /extract
if exist ..\bin\tccle rd /S /Q ..\bin\tccle
xcopy /Y /S /Q .\4E5C5B8 ..\bin\tccle\
rd /S /Q .\4E5C5B8
del tccle.exe
pause