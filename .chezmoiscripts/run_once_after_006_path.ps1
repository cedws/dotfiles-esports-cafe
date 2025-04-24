$binPath = Join-Path $HOME "bin"

if (-not (Test-Path -Path $binPath -PathType Container)) {
    New-Item -Path $binPath -ItemType Directory -Force
}

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($currentPath -split ";" -notcontains $binPath) {
    $newPath = "$currentPath;$binPath"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    $env:PATH = "$env:PATH;$binPath"
}
