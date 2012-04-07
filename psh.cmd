@echo off

SET PORTABLEROOT=%~dp0
SET HOMEDRIVE=%~d0
SET HOMEPATH=%~p0profile
SET USERPROFILE=%PORTABLEROOT%profile
SET PSPROFILE=%USERPROFILE%\Profile.ps1
SET PATH=%PORTABLEROOT%bin;%PORTABLEROOT%bin\console2;%PORTABLEROOT%bin\sysinternals;%PATH%
IF DEFINED %1 SET PROFILE=%1

%SystemRoot%\System32\WindowsPowerShell\v1.0\PowerShell.exe -nologo -noexit -noprofile -executionpolicy bypass -file "%PSPROFILE%"