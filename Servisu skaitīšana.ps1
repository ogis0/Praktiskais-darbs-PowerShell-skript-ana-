$servisi = @(Get-Service)
$darbojas = 0
$aptureti = 0

foreach ($serviss in $servisi) {
    if ($serviss.Status -eq 'Running') {
        $darbojas = $darbojas + 1
    }
    if ($serviss.Status -eq 'Stopped') {
        $aptureti = $aptureti + 1
    }
}

$summa = $darbojas + $aptureti

Write-Host "Darbojas:         $darbojas"
Write-Host "Apturēti:         $aptureti"
Write-Host "Summa:            $summa"
Write-Host "Kopā servisu:     $($servisi.Count)"
