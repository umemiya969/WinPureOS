# Disable Windows Copilot
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsCopilot" `
 /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

# Hide Copilot button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
 /v ShowCopilotButton /t REG_DWORD /d 0 /f

# Disable Bing AI search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" `
 /v BingSearchEnabled /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" `
 /v CortanaConsent /t REG_DWORD /d 0 /f

# Disable online speech & typing
reg add "HKCU\Software\Microsoft\InputPersonalization" `
 /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f

reg add "HKCU\Software\Microsoft\InputPersonalization" `
 /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
