@echo off

SET PORTABLEROOT=%~dp0
SET HOME=%PORTABLEROOT%profile
SET CONSOLECONFIG=%HOME%\console.config
SET PATH=%PORTABLEROOT%bin;%PORTABLEROOT%scripts;%PORTABLEROOT%bin\console2;%PORTABLEROOT%bin\sysinternals;%PORTABLEROOT%bin\msysgit\bin;%PORTABLEROOT%bin\msysgit\mingwbin;%PORTABLEROOT%bin\msysgit\cmd;%PORTABLEROOT%bin\TortoiseHg;%PORTABLEROOT%bin\SlikSvn\bin;%PATH%
SET STARTTAB=CMD
IF NOT "%~1"=="" SET STARTTAB=%1

start console.exe -t %STARTTAB% -c "%CONSOLECONFIG%" -d "%PORTABLEROOT%"
