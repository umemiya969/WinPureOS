# ============================================
# WinPureOS - PURE MODE (TOTAL)
# ============================================

Write-Host "[WinPureOS] Applying PURE MODE..." -ForegroundColor Cyan

$modules = @(
 "..\modules\ads-nuker.ps1",
 "..\modules\ai-killer.ps1",
 "..\modules\telemetry-zero.ps1",
 "..\modules\services-prune.ps1",
 "..\modules\appx-purge.ps1",
 "..\modules\firewall-silence.ps1"
)

foreach ($module in $modules) {
 Write-Host "-> Running $module"
 . $PSScriptRoot\$module
}

Write-Host "[WinPureOS] PURE MODE APPLIED. REBOOT REQUIRED." -ForegroundColor Green
