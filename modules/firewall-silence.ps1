netsh advfirewall firewall add rule `
 name="Block Microsoft Telemetry" `
 dir=out action=block `
 remoteip=13.64.0.0/11 `
 enable=yes
