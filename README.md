# Windows 10 Update Disabler
An executable cmd batch script that 100% Disables Windows 10 Update.

This error message shows in update center, when windows update is disabled.

![alt Preview](https://github.com/TarikSeyceri/Windows-10-Update-Disabler/raw/master/Windows%2010%20Update%20Disabled%20Error%20Message.png?raw=true)

# Why Disable Windows Update?

## Reasons NOT to Disable Windows Update
* When disabling Windows Update, your Windows wouldn't have the latest Security Patches other than fixing bugs and adding new features which all provided by Microsoft. Windows Operating System has lots of bugs. New Security vulnerabilities get discovered every now and then, some are high-severity vulnerabilities.

* Some Microsoft other services does not work properly when windows update is disabled, for an example, you must install Microsoft Office, Microsoft Visual Studio or MSSQL Server, etc.. before disabling windows update, because they get support from windows update to accomplish their installtion.

## Reasons To Disable Windows Update
* If you have a Potato PC (Slow, Low Memory, Low Storage, Old). We all have/had one.
* If you have a Slow or Limited Internet Connection.
* If you don't care about getting information leaked or getting hacked, no private data stored, basically a computer to play games for kids or something.
* If you have a Closed Limited Network Environment or Virtual Machine, or maybe a VPN connected all the time.

# What does this tool do exactly?

1. It disables windows update services and their helpers.
2. It adds windows update prevention registry keys.
3. It disables windows update task schedules.
4. It deletes already downloaded windows update files.
5. It cleans windows temporary files.

# How to use?

* Just download the "Windows 10 Update Disabler.bat", and right click on it then run as administrator.

* You can renable windows update by downloading "Windows 10 Update Enabler.bat", and right clicking on it then run as administrator. It will reverse the work of "Windows 10 Update Disabler.bat", however it doesn't recover the windows update files it deleted.

# Warnings!
- Do NOT Run this tool while installing any program or game. If you run it during any installation, the installation will most likely to fail, and you may not have the option to reinstall!
  
- This tool will not prevent a `Pending Windows Update` from installation, as the Pending process means everything is downloaded and almost installed and just a restart is required.

# Notes

* This tool is in BETA, Still under testing. So far working fine!, i can't guarantee its safety, not just yet. I will test it on 15 production PCs on VPN for couple of months. then i can say it is safe. So use it under your own risk.

* It is written for Windows 10, not tested on other windows versions
