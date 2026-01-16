function Apply-AppxPolicy {

    Write-Host "[-] Removing bundled consumer apps"

    $apps = @(
        "*Microsoft.BingNews*",
        "*Microsoft.GetHelp*",
        "*Microsoft.Getstarted*",
        "*Microsoft.MicrosoftSolitaireCollection*"
    )

    foreach ($app in $apps) {
        Get-AppxPackage $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    }
}
