$procesi = Get-CimInstance Win32_Process

foreach ($p in $procesi) {
    $ipasnieks = Invoke-CimMethod -InputObject $p -MethodName GetOwner
    Write-Host "$($p.Name)   $($p.ProcessId)   $($ipasnieks.Domain)\$($ipasnieks.User)"
}
