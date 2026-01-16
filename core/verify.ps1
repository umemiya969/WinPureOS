# =================================================
# WinPureOS - STRICT VERIFY
# =================================================

$ErrorActionPreference = "SilentlyContinue"

function Check-Reg {
 param ($Path, $Name, $Expected)
 $val = (Get-ItemProperty $Path -Name $Name).$Name
 if ($val -eq $Expected) {
   Write-Host "[PASS] $Name = $Expected" -ForegroundColor Green
 } else {
   Write-Host "[FAIL] $Name = $val (expected $Expected)" -ForegroundColor Red
 }
}

function Check-Service {
 param ($Name)
 $svc = Get-Service $Name
 if ($svc.Status -eq "Stopped" -and $svc.StartType -eq "Disabled") {
   Write-Host "[PASS] Service $Name disabled" -ForegroundColor Green
 } else {
   Write-Host "[FAIL] Service $Name is $($svc.Status) / $($svc.StartType)" -ForegroundColor Red
 }
}

Write-Host "`n=== WinPureOS SYSTEM AUDIT ===" -ForegroundColor Cyan

# -------------------------------------------------
# AI / Copilot
# -------------------------------------------------
Write-Host "`n[AI / COPILOT]" -ForegroundColor Yellow

Check-Reg `
 "HKLM:\Software\Policies\Microsoft\Windows\WindowsCopilot" `
 "TurnOffWindowsCopilot" 1

Check-Reg `
 "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" `
 "BingSearchEnabled" 0

Check-Reg `
 "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" `
 "CortanaConsent" 0

# -------------------------------------------------
# TELEMETRY
# -------------------------------------------------
Write-Host "`n[TELEMETRY]" -ForegroundColor Yellow

Check-Reg `
 "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" `
 "AllowTelemetry" 0

Check-Reg `
 "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" `
 "Enabled" 0

Check-Service "DiagTrack"
Check-Service "dmwappushservice"

# -------------------------------------------------
# MARKETING / ADS
# -------------------------------------------------
Write-Host "`n[MARKETING & ADS]" -ForegroundColor Yellow

Check-Reg `
 "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" `
 "DisableWindowsConsumerFeatures" 1

$cdm = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
Check-Reg $cdm "SystemPaneSuggestionsEnabled" 0
Check-Reg $cdm "SubscribedContent-338388Enabled" 0

# -------------------------------------------------
# PERSONALIZATION / INPUT DATA
# -------------------------------------------------
Write-Host "`n[INPUT & PERSONALIZATION]" -ForegroundColor Yellow

Check-Reg `
 "HKCU:\Software\Microsoft\InputPersonalization" `
 "RestrictImplicitTextCollection" 1

Check-Reg `
 "HKCU:\Software\Microsoft\InputPersonalization" `
 "RestrictImplicitInkCollection" 1

# -------------------------------------------------
# CONSUMER APP PRESENCE
# -------------------------------------------------
Write-Host "`n[CONSUMER APPS]" -ForegroundColor Yellow

$apps = @("*xbox*", "*bing*", "*feedbackhub*")
foreach ($app in $apps) {
 if (Get-AppxPackage $app -AllUsers) {
   Write-Host "[FAIL] App present: $app" -ForegroundColor Red
 } else {
   Write-Host "[PASS] App removed: $app" -ForegroundColor Green
 }
}

# -------------------------------------------------
# FIREWALL / NETWORK SILENCE
# -------------------------------------------------
Write-Host "`n[NETWORK SILENCE]" -ForegroundColor Yellow

$rule = netsh advfirewall firewall show rule name="Block Microsoft Telemetry"
if ($rule -match "Enabled:\s+Yes") {
 Write-Host "[PASS] Telemetry firewall rule active" -ForegroundColor Green
} else {
 Write-Host "[FAIL] Telemetry firewall rule missing or disabled" -ForegroundColor Red
}

# -------------------------------------------------
# SUMMARY
# -------------------------------------------------
Write-Host "`n=== AUDIT COMPLETE ===" -ForegroundColor Cyan
Write-Host "Any FAIL above means WinPureOS is NOT fully enforced." -ForegroundColor DarkYellow
