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
title Ofuscating...
if "%~1"=="" exit /b
if /i "%~x1" neq ".bat" if /i "%~x1" neq ".cmd" exit /b
for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil was not found!
  pause
  exit /b
)
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%~n1___%~x1"
del "temp.~b64"
copy "%~n1___%~x1" /b + "%~1" /b