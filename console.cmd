@echo off
SET PORTABLEROOT=%~dp0
SET HOMEDRIVE=%~d0
SET HOMEPATH=%~p0profile
SET USERPROFILE=%PORTABLEROOT%profile
SET CONFIG=%USERPROFILE%\console.config
start /D "%PORTABLEROOT%bin\console2" console.exe -c "%CONFIG%" -d "%PORTABLEROOT%"