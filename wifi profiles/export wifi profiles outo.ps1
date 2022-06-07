if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
Install-Module -Name WifiTools -Force
$wifiname = Get-WifiState | Select-Object -ExpandProperty ESSID

New-Item -Path ".\" -Name "$wifiname" -ItemType "directory"

netsh wlan export profile "$wifiname" key=clear folder=".\$wifiname"

New-Item -Path ".\$wifiname" -Name "Wi-Fi-$wifiname.bat" -ItemType "file" -Value "Netsh WLAN add profile filename=Wi-Fi-$wifiname.xml"