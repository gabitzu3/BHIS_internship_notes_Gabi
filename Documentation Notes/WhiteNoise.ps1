$TopListUrl      = "https://tranco-list.eu/top-1m.csv.zip"

$TempZip         = Join-Path $env:TEMP "tranco-top-1m.csv.zip"

$ExtractDir      = Join-Path $env:TEMP "tranco_toplist_extract"

$LocalPoolFile   = Join-Path $env:USERPROFILE "Documents\tranco_random_sites_pool.txt"

$PoolSize        = 5000        # pick 5k (set to 10000 for 10k)

$WaitSeconds     = 240         # how long to leave the page open

$ForceRefresh    = $false      # set to $true to force re-download each run

$UseEdge         = $true       # prefer msedge.exe      -// set $false to use Start-Process $url default browser


# Tranco download (daily). If you prefer subdomains, change to the 'incl-subdomains' variant for the Tranco site.

function Build-PoolFromTranco {
    Write-Output "Downloading Tranco list from $TopListUrl ..."
    try {
        Invoke-WebRequest -Uri $TopListUrl -OutFile $TempZip -UseBasicParsing -ErrorAction Stop
    } catch {
        Write-Error "Download failed: $_"
        return $false
    }

    if (Test-Path $ExtractDir) { Remove-Item -Recurse -Force $ExtractDir }
    New-Item -ItemType Directory -Path $ExtractDir | Out-Null

    try {
        Expand-Archive -Path $TempZip -DestinationPath $ExtractDir -Force
    } catch {
        Write-Error "Failed to extract archive: $_"
        return $false
    }

    $csv = Get-ChildItem -Path $ExtractDir -Filter *.csv -Recurse | Select-Object -First 1
    if (-not $csv) {
        Write-Error "No CSV found inside archive."
        return $false
    }
    Write-Output "CSV found: $($csv.FullName)"

    try {
        $domains = Import-Csv -Path $csv.FullName -Header Rank,Domain -Delimiter ',' | Select-Object -ExpandProperty Domain
    } catch {
        Write-Error "Failed to parse CSV: $_"
        return $false
    }

    if (-not $domains -or $domains.Count -lt 1) {
        Write-Error "No domains parsed from CSV."
        return $false
    }

    $count = [math]::Min($PoolSize, $domains.Count)
    $pool = $domains | Get-Random -Count $count
    $pool | Set-Content -Path $LocalPoolFile -Encoding UTF8
    Write-Output "Built local pool with $($pool.Count) domains at: $LocalPoolFile"
    return $true
}

if ($ForceRefresh -or -not (Test-Path $LocalPoolFile)) {
    $ok = Build-PoolFromTranco
    if (-not $ok) { Throw "Failed to build Tranco pool. Aborting." }
}

$pool = Get-Content -Path $LocalPoolFile | Where-Object { $_ -and $_.Trim().Length -gt 0 }
if (-not $pool -or $pool.Count -lt 1) { Throw "Local pool is empty." }

$domain = ($pool | Get-Random).Trim()
if ($domain -notmatch '^https?://') { $url = "https://$domain" } else { $url = $domain }

Write-Output "Launching: $url  (waiting $WaitSeconds seconds)"

$launchedProc = $null
if ($UseEdge -and (Get-Command "msedge.exe" -ErrorAction SilentlyContinue)) {
    $launchedProc = Start-Process -FilePath "msedge.exe" -ArgumentList "--new-window",$url -PassThru
} else {
    Start-Process $url
}

Start-Sleep -Seconds $WaitSeconds

if ($launchedProc -and $launchedProc.Id) {
    try {
        Stop-Process -Id $launchedProc.Id -Force -ErrorAction Stop
        Write-Output "Stopped launched process ID $($launchedProc.Id)."
    } catch {
        Write-Warning "Couldn't stop the launched process (it might already be closed): $_"
    }
} else {
    $toKill = @("msedge","chrome","firefox","iexplore")
    foreach ($name in $toKill) {
        try { Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue } catch {}
    }
    Write-Output "Fallback: attempted to stop common browser processes."
}

Write-Output "Done. :)"



