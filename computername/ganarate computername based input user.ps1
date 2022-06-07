Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
$firstname = Read-Host -Prompt 'Input userfirstname'
$lastname = Read-Host -Prompt 'Input lastname'
$first = $firstname.Substring(0,2)
$sec = $lastname.Substring($index,3)
New-Item -Path "c:\" -Name "Temp" -ItemType "directory"
$name = "YK-$first$sec-L".ToUpper() | Out-File -FilePath c:\Temp\tmp.txt
Get-Content c:\Temp\tmp.txt

pause

