::  __  __       _          _    ____ 
:: |  \/  | __ _| |_ ___   / \  / ___|
:: | |\/| |/ _` | __/ _ \ / _ \| |  _ 
:: | |  | | (_| | ||  __// ___ \ |_| |
:: |_|  |_|\__,_|\__\___/_/   \_\____|
::
:: © Copyright 2026 - MateAG
:: All rights reserved. Any copy without 
:: consent of this code will be reported.
::
:: ℹ > This project is only for educational purposes.
:: The creator is NOT responsible of any illegal/malicious use
:: of this project.
::
:: The creator advices you to use this for testing and
:: legal activities. If you want to install this on
:: someone else computer, please ask them for the
:: permission to.
::
:: Thank you and happy testing! <3

@echo off
title Uninstaller
color 0b
setlocal enabledelayedexpansion

:UAC
net session >nul 2>&1
if %errorlevel%==0 goto :code

powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" -ErrorAction SilentlyContinue
if %errorlevel% neq 0 (
    goto UAC
    cls
)
exit /b
cls

:code
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Please, disable your computer antivirus/firewall to avoid permission errors.', 'MateAG', [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)"
setlocal enabledelayedexpansion

set "vbsFile=%temp%\prompt.vbs"

> "%vbsFile%" echo filename = InputBox("Please introduce your executable name without the file extension:", "MateAG")
>> "%vbsFile%" echo WScript.Echo filename
>> "%vbsFile%" echo WScript.Echo link

set "counter=0"
for /f "delims=" %%a in ('cscript //nologo "%vbsFile%"') do (
    set /a counter+=1
    if !counter! == 1 set "FILE=%%a"
)

del "%vbsFile%"
cls

color 0e
echo [*] Stopping active processes...
taskkill -f -im %FILE%.exe >nul 2>&1
timeout /t 1 /nobreak >nul
cls

color 0c
echo [-] Deleting RAT directories...
del /f /q "C:\Windows\System32\ZZZ_Security\%FILE%.exe" >nul 2>&1
del /f /q "C:\Windows\System32\ZZZ_Security\init.bat" >nul 2>&1
del /f /q "C:\Program Files\Executable-213njkb1\pys_exe.exe"
del /f /q "C:\Program Files\Executable-213njkb1\init_bat.bat"
rd /s /q "C:\Windows\System32\ZZZ_Security" >nul 2>&1
rd /s /q "C:\Program Files\Executable-213njkb1" >nul 2>&1
timeout /t 1 /nobreak >nul
cls

color 0b
echo [*] Restoring original registry keys...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\System32\userinit.exe" /f >nul 2>&1
timeout /t 1 /nobreak >nul
cls

color 0c
echo [-] Removing extra folders and artifacts...
del /f /q "C:\Users\%username%\%FILE%\%FILE%.exe" >nul 2>&1
rd /s /q "C:\Users\%username%\%FILE%" >nul 2>&1
timeout /t 1 /nobreak >nul
cls

color 0d
echo [*] Removing the persistence entry in the Registry...
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "%FILE%" /f >nul 2>&1
timeout /t 1 /nobreak >nul
cls

color 0e
echo [*] Revoking Microsoft Defender exclussions...
powershell -Command "$paths = @('C:\Program Files\Executable-213njkb1\pys_exe.exe', 'C:\Program Files\Executable-213njkb1\', 'C:\Users\%username%\%FILE%\%FILE%.exe', 'C:\Users\%username%\AppData\Roaming\%FILE%\%FILE%.exe', 'C:\Windows\System32\ZZZ_Security\%FILE%.exe'); $procs = @('%FILE%.exe', '%FILE%.exe*', 'reg.exe', 'reg.exe*'); foreach ($path in $paths) { Remove-MpPreference -ExclusionPath $path -ErrorAction SilentlyContinue }; foreach ($proc in $procs) { Remove-MpPreference -ExclusionProcess $proc -ErrorAction SilentlyContinue }" >nul 2>&1
timeout /t 1 /nobreak >nul
cls

echo ======================================================
echo           UNINSTALLATION SUCCEDED!
echo ======================================================
echo.
echo Closing in 5 seconds or close manually.
color 0a
color a0
timeout /t 1 /nobreak >nul
color a0
timeout /t 1 /nobreak >nul
color 0a
timeout /t 1 /nobreak >nul
color a0
timeout /t 1 /nobreak >nul
color 0a
timeout /t 1 /nobreak >nul
del /f /q %~f0