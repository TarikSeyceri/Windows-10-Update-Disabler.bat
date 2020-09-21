rem This script was written by Tarik Seyceri - Published in 2020
rem email: tarik@seyceri.info
cls

@echo off

echo.
echo Welcome to Windows 10 Update Enabler
echo.

rem Check If User Has Admin Privileges
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
) else (
    echo You must run me as an Administrator. Exiting..
    echo.
    echo Right-click on me and select ^'Run as Administrator^' and try again.
    echo.
    echo Press any key to exit..
    pause > NUL
    exit
)

echo.

rem Enable Update Services and Their Helpers
sc config wuauserv start= auto
sc failure wuauserv reset= 1 actions= "restart/5000"
net start wuauserv

sc config bits start= auto
sc failure bits reset= 1 actions= "restart/5000"
net start bits

sc config dosvc start= auto
sc failure dosvc reset= 1 actions= "restart/5000"
net start dosvc

rem Deleting Update Prevention Registry Keys
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /va /f

rem Enable Update Task Schedules
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /ENABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /ENABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\sih" /ENABLE
SCHTASKS /Change /TN "\Microsoft\Windows\WindowsUpdate\sihboot" /ENABLE

SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant" /ENABLE
SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantCalendarRun" /ENABLE
SCHTASKS /Change /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantWakeupRun" /ENABLE

shutdown /r /f /t 10 /c "Windows 10 Update Enabled, Restarting in 10 seconds."

echo.
echo Windows 10 Update Enabled, Restarting in 10 seconds.
echo.

pause > NUL
exit
