if ($args.Length -le 0 -Or $args.Length -gt 1) 
{
    Write-Host "! Fornire il nome del file che contiene la lista dei server in input !"
    break    
}

$filename=$args[0].tostring()

$pathCSV="C:\script"
if (!(Test-Path $pathCSV)){
    New-Item -ItemType Directory -Path $pathCSV
}

$serverlist = @(get-content -Path $filename)
foreach ($server in $serverlist){
    $Zonelist = Get-DnsServerZone -ComputerName $server
	Get-DnsServerSetting -ComputerName $server | export-csv "$pathCSV\setting.csv" -Append -NoTypeInformation
	#Write-Output "server: $server" #| export-csv "$pathCSV\zone.csv" -Append -NoTypeInformation
	Get-DnsServerZone -ComputerName $server |select @{n='Server';e={$server}},ZoneName,ZoneType,IsAutoCreated,IsDsIntegrated,IsReverseLookupZone,IsSigned|  export-csv 'c:\script\zone.csv' -Append -NoTypeInformation

    foreach ($Zone in $Zonelist.ZoneName){
		#Write-Output "Zone: $Zone" | export-csv "$pathCSV\masterservers.csv" -Append -NoTypeInformation
        Get-DnsServerZone -ComputerName $server $Zone | select @{n='Zone';e={$Zone}},masterservers | export-csv "$pathCSV\masterservers.csv" -Append -NoTypeInformation
    }
}