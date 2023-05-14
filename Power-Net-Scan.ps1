Function Get-ActiveLink {
    $links = Get-NetAdapter
    for ($i = 0; $i -lt $links.Count; $i++) {
        $lStat = $links[$i].Status
        $lSpeedArr = $links[$i].LinkSpeed.Split()
        $lSpeed = [int]$lSpeedArr[0]
        if($lStat -eq "Up" -AND $lSpeed -gt 0 ){
            Write-Output $links[$i]
        }
    }
}

for ($i = 0; $i -lt 254; $i++) {
    Get-WmiObject Win32_PingStatus -Filter "Address='192.168.0.$i' and Timeout=200 and ResolveAddressNames='true' and StatusCode=0"
}