# Disable ALL Windows ads & suggestions

$cdm = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"

$keys = @(
 "ContentDeliveryAllowed",
 "OemPreInstalledAppsEnabled",
 "PreInstalledAppsEnabled",
 "SilentInstalledAppsEnabled",
 "SystemPaneSuggestionsEnabled",
 "SubscribedContent-338388Enabled",
 "SubscribedContent-353694Enabled"
)

foreach ($key in $keys) {
 Set-ItemProperty -Path $cdm -Name $key -Value 0 -Force
}

# Disable consumer features
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" `
 /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
