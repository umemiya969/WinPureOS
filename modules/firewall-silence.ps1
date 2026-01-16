function Apply-NetworkPolicy {

    Write-Host "[-] Silencing known telemetry endpoints"

    $hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

    $domains = @(
        "vortex.data.microsoft.com",
        "settings-win.data.microsoft.com"
    )

    foreach ($d in $domains) {
        if (-not (Select-String $hostsPath $d -Quiet)) {
            Add-Content $hostsPath "0.0.0.0 $d"
        }
    }
}
