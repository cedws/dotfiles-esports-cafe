$downloadUrl = "https://github.com/NeverSinkDev/NeverSink-Filter-for-PoE2/archive/refs/heads/main.zip"
$downloadPath = "$env:TEMP\neversink_filter.zip"
$extractPath = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\My Games\Path of Exile 2"

if (-not (Test-Path -Path $extractPath)) {
    New-Item -Path $extractPath -ItemType Directory -Force | Out-Null
}

try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -UseBasicParsing

    if (Test-Path -Path $downloadPath) {
        Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

        $extractedDir = Get-ChildItem -Path $extractPath -Directory | Where-Object { $_.Name -like "NeverSink-Filter-for-PoE2-*" } | Select-Object -First 1
        if ($extractedDir) {
            Get-ChildItem -Path $extractedDir.FullName | Move-Item -Destination $extractPath -Force
            Remove-Item -Path $extractedDir.FullName -Force -Recurse
        }

        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Error "Failed to download the filter."
    }
} catch {
    Write-Error "An error occurred: $_"
}
