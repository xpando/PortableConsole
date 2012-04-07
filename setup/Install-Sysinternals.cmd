@echo off
..\bin\wget.exe -v -O "sysinternals.zip" "http://download.sysinternals.com/files/SysinternalsSuite.zip"
if exist ..\bin\Sysinternals rd /S /Q ..\bin\Sysinternals
..\bin\7za.exe x -o"..\bin\Sysinternals" sysinternals.zip
del sysinternals.zip
pause