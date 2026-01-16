function Apply-MarketingPolicy {

    Write-Host "[-] Removing ads & suggestions"

    $cdm = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    New-Item $cdm -Force | Out-Null

    $keys = @(
        "SubscribedContent-338388Enabled",
        "SubscribedContent-353694Enabled",
        "SystemPaneSuggestionsEnabled"
    )

    foreach ($k in $keys) {
        Set-ItemProperty -Path $cdm -Name $k -Type DWord -Value 0
    }

    Set-ItemProperty `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" `
        -Name "DisabledByGroupPolicy" -Type DWord -Value 1 -Force
}

function Restore-MarketingPolicy {

    Write-Host "[+] Restoring content suggestions"

    $cdm = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"

    foreach ($k in @(
        "SubscribedContent-338388Enabled",
        "SubscribedContent-353694Enabled",
        "SystemPaneSuggestionsEnabled"
    )) {
        Remove-ItemProperty -Path $cdm -Name $k -ErrorAction SilentlyContinue
    }

    Remove-ItemProperty `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" `
        -Name "DisabledByGroupPolicy" -ErrorAction SilentlyContinue
}
