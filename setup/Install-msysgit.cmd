@echo off
..\bin\wget.exe -v -O "msysgit.7z" "http://msysgit.googlecode.com/files/PortableGit-1.7.11-preview20120620.7z"
if exist ..\bin\msysgit rd /S /Q ..\bin\msysgit
..\bin\7za.exe x -o"..\bin\msysgit" msysgit.7z
del msysgit.7z
pause
