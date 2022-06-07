if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$user = (Get-WMIObject -ClassName Win32_ComputerSystem).Username
$index2 = $user.IndexOf("\")
$first = $user.Substring($index2+1,2)
$index = $user.IndexOf(".")
$sec = $user.Substring($index+1,3)
New-Item -Path "c:\" -Name "temp" -ItemType "directory"
"YK-$first$sec-L".ToUpper() | Out-File -FilePath c:\Temp\tmp.txt
$name = Get-Content c:\Temp\tmp.txt
 Write-Warning "computer name will changed to $name"

$confirmation = Read-Host "change computer name? [y/n]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "change computer name? [y/n]"
}

Rename-Computer -newname “$name”

pause

