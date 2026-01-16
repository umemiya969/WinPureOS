# ============================================
# WinPureOS - RESTORE DEFAULT
# ============================================

Write-Host "[WinPureOS] Restoring Windows defaults..." -ForegroundColor Yellow

# Re-enable telemetry
reg delete "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /f

# Re-enable Copilot
reg delete "HKLM\Software\Policies\Microsoft\Windows\WindowsCopilot" /f

# Re-enable ads
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /f

# Re-enable services
$services = @(
 "DiagTrack",
 "dmwappushservice",
 "WerSvc"
)

foreach ($svc in $services) {
 Set-Service $svc -StartupType Manual -ErrorAction SilentlyContinue
 Start-Service $svc -ErrorAction SilentlyContinue
}

Write-Host "[WinPureOS] Restore complete. Reboot recommended."
