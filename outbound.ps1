Param(
    #[string[]]$portrange
    [Parameter(Mandatory=$True,HelpMessage='Please enter port range (1..n) or list (22,53,80,443)',ParameterSetName='ports')]
    [ValidateNotNullOrEmpty()]
    [int[]] $ports
)

#Define external host with open ports to test against
[string] $testhost = "allports.exposed"

if (Test-Connection -Count 1 $testhost -Quiet) {
    Write-Host "DNS Translation is working`n" -ForegroundColor Green
}
else {
    Write-Host "DNS Translation failed`n" -ForegroundColor Red
}

#Open connection for each port from the range
Foreach ($p in $ports)
{
    $Socket = New-Object Net.Sockets.TcpClient      
    $ErrorActionPreference = 'SilentlyContinue'
    #Connect on the given port
    $Socket.Connect($testhost, $p)

    #Determine if the connection is established
    if ($Socket.Connected) {
        Write-Host "Outbound port $p is open." -ForegroundColor Green
        $Socket.Close()
    }
    else {
        Write-Host "Outbound port $p is closed or filtered."
    }
} #end foreach
