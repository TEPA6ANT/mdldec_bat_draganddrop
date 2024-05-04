@echo off

if "%~1"=="" (
    echo FUCK YOU!!! YOU FUCKIN DICK!!!
    pause
    exit /b
)

type nul > activities.txt
cd /d %~dp1
%~dp0mdldec_win32.exe %~nx1

cd /d %~dp1
mkdir orig

for /f "tokens=*" %%f in ('dir /b /a-d *mdl') do (
    if "%%~nf"=="%%~nf.mdl" (
        move /y "%%f" orig
    ) else (
        for /l %%i in (0 1 99) do (
            if exist "%%f" move /y "%%f" orig
        )
        if exist "t.mdl" move /y "t.mdl" orig
    )
)

if exist activities.txt del activities.txt
pause
