function Apply-ServicePolicy {

    Write-Host "[-] Pruning non-essential reporting services"

    $services = @(
        "WerSvc",      # Error reporting
        "PcaSvc"       # Program compatibility telemetry
    )

    foreach ($svc in $services) {
        $s = Get-Service $svc -ErrorAction SilentlyContinue
        if ($s) {
            Stop-Service $svc -Force -ErrorAction SilentlyContinue
            Set-Service $svc -StartupType Disabled
        }
    }
}
