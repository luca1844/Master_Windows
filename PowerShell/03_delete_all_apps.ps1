#######################################################
# Vedere about_Execution_Policies
# Get-ExecutionPolicy -> Se: Restricted -> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
#######################################################

# Controllo privilegi
Write-Host "Checking for elevated permissions..."
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Insufficient permissions to run this script. Open the PowerShell console as an administrator and run this script again."
    Break
}
else {
    Write-Host 'Code is running as administrator — go on executing the script...'
}


# Delete all apps
Get-AppxPackage -AllUsers | Remove-AppxPackage

# Reinstall Windows Store
$nameApps=Get-AppxPackage -AllUsers *WindowsStore* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode

# Reinstall Calculator
$nameApps=Get-AppxPackage -AllUsers *Calculator* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode

# Reinstall Sticky
$nameApps=Get-AppxPackage -AllUsers *Sticky* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode

# Reinstall Photos
$nameApps=Get-AppxPackage -AllUsers *Photos* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode

# Reinstall Camera
$nameApps=Get-AppxPackage -AllUsers *Camera* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode

# Reinstall Mail e Calendar
$nameApps=Get-AppxPackage -AllUsers *windowscommunicationsapps* | select PackageFullName
$nameApps=$nameApps.PackageFullName
Add-AppxPackage -register "C:\Program Files\WindowsApps\$nameApps\appxmanifest.xml" -DisableDevelopmentMode