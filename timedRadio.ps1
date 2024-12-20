#unos url streama poèetnog vremena i vrijeme završteka procesa
param (
    [string]$url,
    [string]$starttime,
    [string]$endtime
)
#funkcija koja provjerava ako je radio stanica veæ pokrenuta te pokreæe radio
#stanicu preko radio stream poveznice npr  "https://audio.radio-banovina.hr:9998/stream"
#u sluèaju da veæ nije otvorena
function Start-Radio {
    param (
        [int]$procnum
    )
    
    if ($procnum -eq 0) {
        Start-Process ffplay.exe -ArgumentList $url 
    }
}
##funkcija koja provjerava broj otvorenih procesa i zaustavlja radio stanicu ako veæ nije zaustavljena
function Stop-Radio {
    param (
        [int]$procnum
    )

    if ($procnum -ne 0) {
        Get-Process ffplay -ErrorAction SilentlyContinue | Stop-Process -Force
    }
}

while ($true) {
#uzima trenutno vrijeme
    $current_time = Get-Date -Format "HH:mm"
#uzima broj procesa sa nazivom ffplay
    $procnum = (Get-Process ffplay -ErrorAction SilentlyContinue).Count
#provjerava ako je vrijeme odmora
    switch ($current_time) {
        {$_ -ge "07:40" -and $_ -lt "08:00"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "08:45" -and $_ -lt "09:00"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "09:35" -and $_ -lt "10:00"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "10:25" -and $_ -lt "11:00"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "11:30" -and $_ -lt "11:35"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "12:20" -and $_ -lt "12:25"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "13:10" -and $_ -lt "13:15"} {
            Start-Radio -procnum $procnum
        }
        {$_ -ge "$starttime" -and $_ -lt "$endtime"} {
            Start-Radio -procnum $procnum
        }
        default {
            Stop-Radio -procnum $procnum
        }
    }
#Program èeka 5 sekundi te ponavlja cijeli proces
    Write-Host "Ceka 5 sekundi"
    Start-Sleep -Seconds 5
   
}