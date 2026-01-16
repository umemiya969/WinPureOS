function Apply-AIPolicy {

    Write-Host "[-] Killing AI / Copilot"

    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Force | Out-Null
    Set-ItemProperty `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" `
        -Name "TurnOffWindowsCopilot" -Type DWord -Value 1

    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Speech" -Force | Out-Null
    Set-ItemProperty `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Speech" `
        -Name "AllowSpeechRecognition" -Type DWord -Value 0

    Set-ItemProperty `
        -Path "HKCU:\Software\Microsoft\InputPersonalization" `
        -Name "RestrictImplicitTextCollection" -Type DWord -Value 1 -Force
}
