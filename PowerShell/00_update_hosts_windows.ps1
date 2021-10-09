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

#######################################################

Set-Location $HOME
New-Item -Name "hosts" -ItemType "file" -Force

$myList = @(
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts"
    "https://someonewhocares.org/hosts/zero/hosts"
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext&useip=0.0.0.0"
    "https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardDNS.txt"
    "https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt"
    "https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardMobileSpyware.txt"
    "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
    "https://winhelp2002.mvps.org/hosts.txt"
    "https://raw.githubusercontent.com/bongochong/CombinedPrivacyBlockLists/master/newhosts-final.hosts"
    "https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt"
    # "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt"
)

ForEach ($i in $myList) {
    wget $i -O file
    Write-Host("Size: " + (Get-Item -Path .\file).length/1MB)
    Get-Content -Path .\file | Where { $_ -match "^0" } | Sort-Object -Unique | Add-Content -Path .\hosts
    Remove-Item -Path .\file
}

#######################################################

New-Item -Name "myHosts" -ItemType "file" -Force
Add-Content -Path .\myHosts "127.0.0.1 localhost"
Add-Content -Path .\myHosts "::1 localhost ip6-localhost ip6-loopback"
Get-Content -Path .\hosts | Where { $_ -match "^0" } | Sort-Object -Unique | Add-Content -Path .\myHosts
Remove-Item -Path .\hosts

# Read-Host "Press any key to continue"

#######################################################

$stopLoop = $false
do
{
    Start-Sleep -Seconds 5
    try
    {
        Get-Content -Path .\myHosts | Set-Content -Force -Path C:\Windows\System32\drivers\etc\hosts
        Write-Host "Sostituzione file completata."
        $stopLoop = $true
    }
    catch
    {
        Stop-Process -Force -Name "GameBar.exe"
        Write-Host "Errore -> Retry."
    }
} while ($stopLoop -eq $false)

# Get-Content -Path .\myHosts | Set-Content -Force -Path C:\Windows\System32\drivers\etc\hosts
Remove-Item -Path .\myHosts