Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
$user = $env:UserName
$first = $user.Substring(0,2)
$index = $user.IndexOf(".")
$sec = $user.Substring($index+1,3)
New-Item -Path "c:\" -Name "Temp" -ItemType "directory"
$name = "YK-$first$sec-L".ToUpper() | Out-File -FilePath c:\Temp\tmp.txt
Get-Content c:\Temp\tmp.txt

pause

