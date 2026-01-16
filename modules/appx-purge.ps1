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

function Restore-AppxPolicy {

    Write-Host "[!] Appx restore skipped (non-reversible)"

    Write-Host "    Use Microsoft Store or reinstall manually."
}
