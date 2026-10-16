$laiks1 = Measure-Command { Get-Service -Name Spooler | Out-Null }
$laiks2 = Measure-Command { Get-CimInstance Win32_Service -Filter "Name='Spooler'" | Out-Null }

Write-Host "Get-Service:          $([math]::Round($laiks1.TotalMilliseconds, 1)) ms"
Write-Host "Get-CimInstance:      $([math]::Round($laiks2.TotalMilliseconds, 1)) ms"
