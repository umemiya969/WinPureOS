<# 
 WinPureOS - Pure OS Enforcement Entry Point
#>

# ===== Safety =====
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run as Administrator"
    exit 1
}

$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent

# ===== Load Modules =====
. "$Root/modules/telemetry-zero.ps1"
. "$Root/modules/ai-killer.ps1"
. "$Root/modules/ads-nuker.ps1"
. "$Root/modules/services-prune.ps1"
. "$Root/modules/appx-purge.ps1"
. "$Root/modules/firewall-silence.ps1"

Write-Host "[WinPureOS] Applying pure baseline..." -ForegroundColor Cyan

Apply-TelemetryPolicy
Apply-AIPolicy
Apply-MarketingPolicy
Apply-ServicePolicy
Apply-AppxPolicy
Apply-NetworkPolicy

Write-Host "[WinPureOS] Done. Reboot recommended." -ForegroundColor Green
