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

function Restore-NetworkPolicy {

    Write-Host "[+] Removing telemetry host blocks"

    $hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

    $domains = @(
        "vortex.data.microsoft.com",
        "settings-win.data.microsoft.com"
    )

    $content = Get-Content $hostsPath
    $filtered = $content | Where-Object {
        $line = $_
        -not ($domains | Where-Object { $line -match $_ })
    }

    Set-Content $hostsPath $filtered
}
