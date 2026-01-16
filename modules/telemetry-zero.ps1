# Disable telemetry
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" `
 /v AllowTelemetry /t REG_DWORD /d 0 /f

reg add "HKLM\Software\Microsoft\Windows\DataCollection" `
 /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f

# Disable Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" `
 /v Enabled /t REG_DWORD /d 0 /f

# Disable app tracking
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
 /v Start_TrackProgs /t REG_DWORD /d 0 /f
