if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

Get-WmiObject -Class Win32_Product | Select-Object name, Version, Caption 
$progname = Read-Host -Prompt 'please type the progrem to remove'
$name = @("*$progname*")

$remove = Get-Package -Provider Programs -IncludeWindowsInstaller -Name "$name" | Select-Object -ExpandProperty name

Write-Warning "you select to remove $remove"

$confirmation = Read-Host "Unistall $remove [y/n]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "Unistall $remove [y/n]"
}

    
Uninstall-Package $remove

$confirmation = Read-Host "continu to EXE removal [y/n]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "continu to EXE removal [y/n]"
}

#for EXE
Install-Script -Name Get-ProgramUninstallString -force
$string = Get-ProgramUninstallString -Name "$remove" | Select-Object -ExpandProperty UninstallString
cmd /c $string /x /quiet /S

pause