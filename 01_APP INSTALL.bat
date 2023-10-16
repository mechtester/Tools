@echo off

setlocal enabledelayedexpansion

set count=1

for %%a in (*.apk) do (
    echo !count!. %%~na
    set /a count+=1
)

set /p appNum=Enter the number of the app you want to install: 

for /f "tokens=1,* delims=." %%a in ('dir /b *.apk') do (
    set /a appNum-=1
    if !appNum! equ 0 (
        set "appName=%%a"
        set "apkName=%%a.%%b"
        goto :install
    )
)

:install
echo.
echo Installing %appName%...
echo.

adb install %apkName%

echo.
echo %appName% installed successfully.
echo.

timeout /t 10 >nul

exit
