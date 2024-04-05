Function Check-RunAsAdministrator()
{
  #Get current user context
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
  #Check user is running the script is member of Administrator Group
  if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
  {
       Write-host "Script is running with Administrator privileges!"
  }
  else
    {
       #Create a new Elevated process to Start PowerShell
       $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
 
       # Specify the current script path and name as a parameter
       $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
 
       #Set the Process to elevated
       $ElevatedProcess.Verb = "runas"
 
       #Start the new elevated process
       [System.Diagnostics.Process]::Start($ElevatedProcess)
 
       #Exit from the current, unelevated, process
       Exit
 
    }
}

#Check Script is running with Elevated Privileges
Check-RunAsAdministrator

# Hide powershell window
# uncomment the next 3 lines, if you want the script to hide itself and run in background
# $t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
# add-type -name win -member $t -namespace native
#[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)
 
#Main script
$baseName = "NostaleClientX"

# Create an infinite loop
while ($true) {
    # Get all processes starting with the base name
    $nostaleProcesses = Get-Process | Where-Object { $_.ProcessName -like "$baseName*" }

    # Terminate processes with no main window (zombie processes)
    foreach ($process in $nostaleProcesses) {
        if ($process.MainWindowTitle -eq "") {
            Stop-Process -Id $process.Id -Force
            Write-Host "Terminated zombie process $($process.Id) - $($process.ProcessName)"
        }
    }

    Write-Host "Finished killing zombie processes."

    # Wait for 10 seconds before running the script again
    Start-Sleep -Seconds 1
}
