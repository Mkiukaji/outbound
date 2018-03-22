# outbound
Test outbound TCP port filtering

## Simple PowerShell script to test TCP port connections to allports.exposed to identify any outbound filtering.

Usage: 

Scan all ports 1-1023:   *outbound.ps1 -ports (1..1023)*

Scan specific ports:     *outbound.ps1 -ports 22,53,80,443*

Scan single port:        *outbound.ps1 -ports 8080*
