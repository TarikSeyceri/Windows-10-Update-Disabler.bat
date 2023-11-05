# Windows 10 Update Disabler
An executable CMD batch script that disables Windows 10 Update.

This error message shows in update center, when windows update is disabled.

![alt Preview](https://github.com/TarikSeyceri/Windows-10-Update-Disabler/raw/master/Windows%2010%20Update%20Disabled%20Error%20Message.png?raw=true)

# Why Disable Windows Update?

## Reasons NOT to Disable Windows Update
* After disabling the Windows Update, your Windows wouldn't get the latest security patches except bug fixes and new features, which are all provided by Microsoft. Windows has plenty of bugs. New security vulnerabilities get discovered every now and then, some being highly severe.

* Other Microsoft services may not work properly after Windows Update is disabled, such as, Microsoft Office, Microsoft Visual Studio, MSSQL Server, etc.. You should install these set of applications beforehand, as they're dependent on Windows Update.

## Reasons To Disable Windows Update
* A potato PC.
* A slow or limited internet connection.
* If you don't care about getting your private info leaked. (Like a gaming PC for children to use)
* If you have a limited network environment, a virtual machine, or a VPN connected at all times.

# What It Does
* Disables Windows Update services and their helpers.
* Adds Windows Update prevention registry keys.
* Disables Windows update task schedules.
* Cleans temporary Windows files (such as old update files).

# How to Use
* Just download the "Windows 10 Update Disabler.bat", right click on the file and run it as administrator.
* You can re-enable Windows Update by downloading "Windows 10 Update Enabler.bat" and repeating the same process. This will reverse the work "Windows 10 Update Disabler.bat" did. However, it does NOT recover previous Windows Update files.

# Warnings
* Do NOT run this tool while installing any program or game. If you run it during any installation, the installation will most likely fail. You also may not have the possibility to reinstall them.

  
# Notes
* This tool is still in Beta stages. I will test it on a dozen of PCs which are in a private network. Use it under your own risk.
* It is written for Windows 10, can not guarantee its effectiveness for other Windows versions.
