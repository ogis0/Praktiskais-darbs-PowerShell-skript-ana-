$os = Get-CimInstance Win32_OperatingSystem

Write-Host $env:COMPUTERNAME
Write-Host $os.Caption
Write-Host $os.BuildNumber
Write-Host $PSVersionTable.PSVersion
Write-Host (Get-Date)
Write-Host (Get-Process).Count
