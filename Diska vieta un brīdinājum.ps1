$robeza = 20

$diski = Get-CimInstance Win32_LogicalDisk -Filter "DriveType = 3"

foreach ($disks in $diski) {
    $kopa = [math]::Round($disks.Size / 1GB, 1)
    $brivs = [math]::Round($disks.FreeSpace / 1GB, 1)

    Write-Host "Disks: $($disks.DeviceID)   Kopējais izmērs: $kopa GB   Brīvs: $brivs GB"

    if ($brivs -lt $robeza) {
        Write-Host "BRĪDINĀJUMS: diskā $($disks.DeviceID) brīvs mazāk par $robeza GB" -ForegroundColor Red
    }
}
