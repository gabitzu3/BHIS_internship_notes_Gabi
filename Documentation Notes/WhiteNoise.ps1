
$RemoteListUrl   = "https://raw.githubusercontent.com/gabitzu3/BHIS_internship_notes_Gabi/refs/heads/main/Documentation%20Notes/WhiteNoise_site_list.txt" #Change this link if needed for another url list
$ForceRefresh    = $false
$PoolSize        = 5000
$WaitSeconds     = 240
$UseEdge         = $true
$LocalPoolFile   = Join-Path $env:USERPROFILE "Documents\tranco_random_sites_pool.txt"

if (-not $PSScriptRoot) { $PSScriptRoot = (Get-Location).ProviderPath }
$LocalListFile   = Join-Path $PSScriptRoot "WhiteNoise_site_list.txt"
$TempDownload    = Join-Path $env:TEMP "whitenoise_sites_download.txt"

function Write-Info([string]$m){ Write-Host "[*] $m" -ForegroundColor Cyan }
function Write-Err([string]$m){ Write-Host "[!] $m" -ForegroundColor Red }

function Try-DownloadList {
    param($url, $outFile)
    if ([string]::IsNullOrWhiteSpace($url)) { return $false }
    Write-Info "Attempting to download remote list from $url ..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outFile -UseBasicParsing -ErrorAction Stop
        Write-Info "Downloaded remote list to $outFile"
        return $true
    } catch {
        Write-Err "Download failed: $($_.Exception.Message)"
        return $false
    }
}

function Normalize-ToHost {
    param([string]$line)
    if (-not $line) { return $null }

    $s = $line.Trim()
    $s = $s -replace '^\uFEFF',''                     
    $s = $s -replace '[^\u0020-\u007E]',''           
    if ($s -eq '') { return $null }
    if ($s.StartsWith('#') -or $s.StartsWith('//')) { return $null }
    $s = $s.Trim('"','''')
    $s = ($s -split '\s+')[0]
    if ($s -match '^(?:https?://)?([^/:?\s]+)') {
        $h = [string]$matches[1]
        $h = $h.TrimEnd('.')
        $h = $h -replace ':\d+$',''
        if ($h.Length -gt 0) { return $h.ToLowerInvariant() }
    }
    return $null
}

function Build-PoolFromList {
    param([string]$sourceFile)
    if (-not (Test-Path $sourceFile)) {
        Write-Err "Source list not found: $sourceFile"
        return $false
    }

    Write-Info "Reading source list: $sourceFile"
    try {
        $raw = Get-Content -Path $sourceFile -ErrorAction Stop
    } catch {
        Write-Err "Failed to read file: $($_.Exception.Message)"
        return $false
    }

    Write-Info "Total raw lines read: $($raw.Count)"

    $hosts = $raw |
        ForEach-Object { Normalize-ToHost $_ } |
        Where-Object { $_ -and $_.Length -gt 0 } |
        Sort-Object -Unique

    Write-Info "Unique hosts parsed: $($hosts.Count)"

    if (-not $hosts -or $hosts.Count -lt 1) {
        Write-Err "No valid hosts found in the source list."

        Write-Host "`n--- Diagnostic: first 20 raw lines (quoted) ---"
        $raw | Select-Object -First 20 | ForEach-Object {
            Write-Host ("'{0}'" -f $_)
        }
        Write-Host "--- end diagnostic ---`n"
        return $false
    }

    $count = [math]::Min($PoolSize, $hosts.Count)
    Write-Info "Selecting $count random hosts from $($hosts.Count) available."
    $pool = $hosts | Get-Random -Count $count

    $poolDir = Split-Path -Parent $LocalPoolFile
    if (-not (Test-Path $poolDir)) { New-Item -ItemType Directory -Path $poolDir -Force | Out-Null }

    $pool | Set-Content -Path $LocalPoolFile -Encoding UTF8
    Write-Info "Built local pool with $($pool.Count) hosts at: $LocalPoolFile"
    return $true
}

$needRebuild = $ForceRefresh -or -not (Test-Path $LocalPoolFile)

if ($RemoteListUrl -and ($ForceRefresh -or -not (Test-Path $LocalListFile))) {
    $ok = Try-DownloadList -url $RemoteListUrl -outFile $TempDownload
    if ($ok) {
        Move-Item -Path $TempDownload -Destination $LocalListFile -Force
        Write-Info "Moved downloaded list to: $LocalListFile"
        $needRebuild = $true
    } else {
        Write-Info "Remote download failed; will attempt to use local list file if present."
        if (-not (Test-Path $LocalListFile)) {
            Write-Err "No usable list available (remote failed and local list missing). Aborting."
            throw "No list available."
        }
    }
}

if ($needRebuild) {
    $ok = Build-PoolFromList -sourceFile $LocalListFile
    if (-not $ok) { throw "Failed to build pool from list. Aborting." }
}

$pool = Get-Content -Path $LocalPoolFile | Where-Object { $_ -and $_.Trim().Length -gt 0 }
if (-not $pool -or $pool.Count -lt 1) { throw "Local pool is empty." }

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
