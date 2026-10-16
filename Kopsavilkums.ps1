$servisi = Get-Service
$no = (Get-Date).AddHours(-48)

Write-Host "Procesu skaits:       $((Get-Process).Count)"
Write-Host "Darbojas servisi:     $(($servisi | Where-Object Status -eq 'Running').Count)"
Write-Host "Apturēti servisi:     $(($servisi | Where-Object Status -eq 'Stopped').Count)"
Write-Host "Kļūdas pēc 48 h:      $((Get-EventLog -LogName System -EntryType Error -After $no).Count)"
Write-Host "Brīvs diskā C:        $([math]::Round((Get-PSDrive C).Free / 1GB, 1)) GB"
