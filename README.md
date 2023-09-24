# NostaleZombieKiller
PowerShell script that kills any Nostale processes running in background

# Why ?
As you mightve noticed, nostale lately started having an annoying bug, that sometimes keep nostale running in background even though you closed it.
This is a powershell script, that upon running checks every 10 seconds, if there are any "Zombie" Nostale processes and kills them. 
It doesnt kill regular nostale clients.

# How to use ?
1. Download the killNostaleZombie.ps1 from this post
2. Double left click it, or right click and press "Run with powershell"

# Note1
If you are using custom name of the NostaleClientX.exe, you will need to change it in the source. As it is right now it will kill only zombie processes that have "NostaleClientX" in name (such as NostaleClientX.exe, NostaleClientX1.exe, NostaleClientX2.exe, etc...)

# Note2
Script is setup so it automatically hides its window after starting, so if you want to close the program later, you will need to find "Windows PowerShell" instance in task manager and close it from there. Or if you are not interested in hiding the window at all, and you want to see it, you can delete lines 36, 37 and 38 in the script itself.
