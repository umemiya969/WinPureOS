<#
 WinPureOS - Restore Engine
 Purpose: Revert WinPureOS policies safely
#>

if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run as Administrator"
    exit 1
}

$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent

# Load restore modules
. "$Root/modules/telemetry-zero.ps1"
. "$Root/modules/ai-killer.ps1"
. "$Root/modules/ads-nuker.ps1"
. "$Root/modules/services-prune.ps1"
. "$Root/modules/appx-purge.ps1"
. "$Root/modules/firewall-silence.ps1"

Write-Host "[WinPureOS] Restoring Windows defaults..." -ForegroundColor Yellow

Restore-TelemetryPolicy
Restore-AIPolicy
Restore-MarketingPolicy
Restore-ServicePolicy
Restore-AppxPolicy
Restore-NetworkPolicy

Write-Host "[WinPureOS] Restore complete. Reboot recommended." -ForegroundColor Green
