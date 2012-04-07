@echo off

SET PORTABLEROOT=%~dp0
SET HOMEDRIVE=%~d0
SET HOMEPATH=%~p0profile
SET USERPROFILE=%PORTABLEROOT%profile
SET CONFIG=%USERPROFILE%\console.config
SET PATH=%PORTABLEROOT%bin;%PORTABLEROOT%bin\console2;%PORTABLEROOT%bin\sysinternals;%PATH%
SET TAB=PowerShell
IF NOT "%~1"=="" SET TAB=%1

start console.exe -t %TAB% -c "%CONFIG%" -d "%PORTABLEROOT%"
