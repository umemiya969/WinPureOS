# ============================================
# WinPureOS - VERIFY SYSTEM STATE
# ============================================

Write-Host "=== WinPureOS Audit ===" -ForegroundColor Cyan

Write-Host "`n[Telemetry]"
Get-Service DiagTrack,dmwappushservice | Select Name,Status,StartType

Write-Host "`n[Copilot]"
Get-ItemProperty `
 "HKLM:\Software\Policies\Microsoft\Windows\WindowsCopilot" `
 -ErrorAction SilentlyContinue

Write-Host "`n[Advertising ID]"
Get-ItemProperty `
 "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" `
 -ErrorAction SilentlyContinue

Write-Host "`n[Firewall Rules]"
netsh advfirewall firewall show rule name=all | findstr Telemetry
