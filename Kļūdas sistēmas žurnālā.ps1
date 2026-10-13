$no = (Get-Date).AddHours(-48)
$kludas = @(Get-EventLog -LogName System -EntryType Error -After $no -ErrorAction SilentlyContinue)

Write-Host "Kļūdu skaits pēdējās 48 stundās: $($kludas.Count)"

if ($kludas.Count -gt 0) {
    $top = $kludas | Group-Object Source | Sort-Object Count -Descending | Select-Object -First 1
    Write-Host "Biežākais avots: $($top.Name)"
    Write-Host "Cik reižu: $($top.Count)"
}
