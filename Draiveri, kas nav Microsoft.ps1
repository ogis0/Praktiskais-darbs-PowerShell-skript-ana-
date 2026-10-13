$darbvirsma = [Environment]::GetFolderPath('Desktop')
$fails = Join-Path $darbvirsma 'draiveri.csv'

$draiveri = Get-CimInstance Win32_PnPSignedDriver |
    Where-Object { $_.DriverProviderName -and $_.DriverProviderName -ne 'Microsoft' } |
    Select-Object DeviceName, DriverProviderName, DriverVersion, DriverDate

$draiveri | Export-Csv -Path $fails -NoTypeInformation -Encoding UTF8

$draiveri | Format-Table -AutoSize
Write-Host "Rindu skaits CSV failā: $(@($draiveri).Count)"
Write-Host "Fails saglabāts: $fails"
