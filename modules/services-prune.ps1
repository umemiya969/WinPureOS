$services = @(
 "DiagTrack",
 "dmwappushservice",
 "WerSvc",
 "RetailDemo",
 "WMPNetworkSvc"
)

foreach ($svc in $services) {
 Stop-Service $svc -Force -ErrorAction SilentlyContinue
 Set-Service $svc -StartupType Disabled -ErrorAction SilentlyContinue
}
