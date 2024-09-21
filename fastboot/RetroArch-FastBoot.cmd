@echo off
TITLE RetroArch FastBoot v0.1
color 0e

if not exist %~dp0settings.cfg goto :missingConfig
if [%1]==[] goto :missingROM

set romPath=%1
set romName=%~n1
set romExt=%~x1
set romExt=%romExt:~1,9%
set retroarchPath=%~dp0\..

set CONFIG=%~dp0settings.cfg
for /f "tokens=1,2 delims==" %%A in (%CONFIG%) do (
	set configExt=%%A
	set configCore=%%B
	if "%%A"=="%romExt%" if "%%B"=="" (goto :missingCore) else (
		set chosenCore=%%B
		goto :runRA)
)

:runRA
	cd /d %retroarchPath%
	@echo ROM Name: %romName%
	@echo Core: %chosenCore%
	start retroarch.exe -L %retroarchPath%\cores\%chosenCore% %romPath%
	exit

:missingConfig
	@echo config.cfg missing
	pause
	exit

:missingCore
	@echo Core for ".%configExt%" not defined. Check config.cfg.
	pause
	exit

:missingROM
	@echo No ROM file specified.
	pause
	exit