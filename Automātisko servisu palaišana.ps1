[CmdletBinding(SupportsShouldProcess)]
param()

$servisi = @(Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' })

if ($servisi.Count -eq 0) {
    Write-Host "Nav servisu, kas ir Automatic un Stopped. Skaits: 0"
}
else {
    Write-Host "Atrasto servisu skaits: $($servisi.Count)"
    foreach ($serviss in $servisi) {
        if ($WhatIfPreference) {
            Write-Host "WhatIf, tiktu palaists: $($serviss.Name)"
        }
        else {
            Write-Host "Palaiž: $($serviss.Name)"
        }
        Start-Service -InputObject $serviss
    }
}
