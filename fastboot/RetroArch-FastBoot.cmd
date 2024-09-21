@echo off
TITLE RetroArch FastBoot v0.2
color 0e

:: Check if settings.cfg exists
if not exist "%~dp0settings.cfg" goto :missingConfig

:: Check if ROM file is specified
if "%~1"=="" goto :missingROM

:: Set variables for ROM details
set "romPath=%~1"
set "romName=%~n1"
set "romExt=%~x1"
set "romExt=%romExt:~1%"  :: Removes the leading dot from the extension
set "retroarchPath=%~dp0\.."

:: Load configuration file
set "CONFIG=%~dp0settings.cfg"
for /f "tokens=1,2 delims==" %%A in (%CONFIG%) do (
    if /i "%%A"=="%romExt%" (
        if "%%B"=="" (goto :missingCore) else (
            set "chosenCore=%%B"
            goto :runRA
        )
    )
)

:: Run RetroArch with the chosen core and ROM
:runRA
cd /d "%retroarchPath%"
@echo ROM Name: %romName%
@echo Core: %chosenCore%
start "" retroarch.exe -L "%retroarchPath%\cores\%chosenCore%" "%romPath%"
exit

:: Error handling sections
:missingConfig
@echo settings.cfg missing. Please ensure it is in the same directory as this script.
pause
exit

:missingCore
@echo Core for ".%romExt%" not defined. Check settings.cfg.
pause
exit

:missingROM
@echo No ROM file specified. Please pass the ROM file as an argument.
pause
exit
