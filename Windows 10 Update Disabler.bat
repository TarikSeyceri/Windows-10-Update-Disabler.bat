rem This script was written by Tarik Seyceri - Published in 2020
rem email: tarik@seyceri.info
cls

@echo off

echo.
echo Welcome to Windows 10 Update Disabler
echo.

rem Check If User Has Admin Privileges
NET SESSION >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Running..
) else (
    echo You must run me as an Administrator. Exiting..
    echo.
    pause
    exit
)

echo.

rem Disable Update Services and Their Helpers
sc config wuauserv start= disabled
sc failure wuauserv reset= 0 actions= ""
net stop wuauserv

sc config bits start= disabled
sc failure bits reset= 0 actions= ""
net stop bits

sc config dosvc start= disabled
sc failure dosvc reset= 0 actions= ""
net stop dosvc

rem Adding Update Prevention Registry Keys
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /d 2 /t REG_DWORD /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AutoInstallMinorUpdates /d 0 /t REG_DWORD /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /d 1 /t REG_DWORD /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoRebootWithLoggedOnUsers /d 1 /t REG_DWORD /f

rem Disable Update Task Schedules
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\sih" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\sihboot" /DISABLE

SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantCalendarRun" /DISABLE
SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantWakeupRun" /DISABLE

rem Delete Some Update Files
del /s /f /q %WinDir%\SoftwareDistribution\Download\*.*

rem Delete Update Helpers
takeown /F %SYSTEMDRIVE%\Windows10Upgrade\* /R /A /D Y
echo Y | cacls %SYSTEMDRIVE%\Windows10Upgrade\*.* /T /grant administrators:F
echo Please wait, this may take a while.
rmdir /S /Q %SYSTEMDRIVE%\Windows10Upgrade\

takeown /F "%SYSTEMDRIVE%\Windows 10 install\*" /R /A /D Y
echo Y | cacls "%SYSTEMDRIVE%\Windows 10 install\*.*" /T /grant administrators:F
echo Please wait, this may take a while.
rmdir /S /Q "%SYSTEMDRIVE%\Windows 10 install\"

rem Windows.Cleaner.v2.0.bat <!--
rem Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.*
del /s /f /q %WinDir%\Prefetch\*.*
del /s /f /q %Temp%\*.*
del /s /f /q %AppData%\Temp\*.*
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*

rem Delete Temporary Folders
rd /s /q %WinDir%\Temp
rd /s /q %WinDir%\Prefetch
rd /s /q %Temp%
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp

rem Recreate Empty Temporary Folders
md %WinDir%\Temp
md %WinDir%\Prefetch
md %Temp%
md %AppData%\Temp
md %HomePath%\AppData\LocalLow\Temp

rem Edit Windows.old Folder Privileges and Deleting It
takeown /F %SYSTEMDRIVE%\Windows.old\* /R /A /D Y
echo Y | cacls %SYSTEMDRIVE%\Windows.old\*.* /T /grant administrators:F
echo Please wait, this may take a while.
rmdir /S /Q %SYSTEMDRIVE%\Windows.old\
rem -->

shutdown /r /f /t 10 /c "Windows 10 Update Disabled, Restarting in 10 seconds."

echo.
echo Windows 10 Update Disabled, Restarting in 10 seconds.
echo.

pause
