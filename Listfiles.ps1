param([Parameter(Mandatory=$true)][string]$path)

Get-ChildItem -Path $path 
Select-Object -Property Mode, length