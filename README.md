# NostaleZombieKiller
PowerShell script that kills any Nostale processes running in background

# Why ?
As you mightve noticed, nostale lately started having an annoying bug, that sometimes keep nostale running in background even though you closed it.
This is a powershell script, that upon running checks every 1 second, if there are any "Zombie" Nostale processes and kills them. 
It doesnt kill regular nostale clients.

# How to use ?
1. Download the killNostaleZombie.ps1 from this post
2. Double left click it, or right click and press "Run with powershell"

# Note1
If you are using custom name of the NostaleClientX.exe, you will need to change it in the source. As it is right now it will kill only zombie processes that have "NostaleClientX" in name (such as NostaleClientX.exe, NostaleClientX1.exe, NostaleClientX2.exe, etc...)

# Note2
If you uncomment lines 36, 37 and 38 the powershell window will hide itself automatically, but if you want to close it later, you will need to find "Windows PowerShell" instance in task manager and close it from there. So I do not reccomend it.
