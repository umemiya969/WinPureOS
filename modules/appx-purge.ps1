$apps = @(
 "*xbox*",
 "*bing*",
 "*zune*",
 "*gethelp*",
 "*feedbackhub*"
)

foreach ($app in $apps) {
 Get-AppxPackage $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
}
