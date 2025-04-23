$extensions = @(
    "ddkjiahejlhfcafbddmgiahcphecmpfh"
)

$updateURL = "https://clients2.google.com/service/update2/crx"

$regBasePath = if ([Environment]::Is64BitOperatingSystem) {
    "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions"
} else {
    "HKLM:\Software\Google\Chrome\Extensions"
}

foreach ($extensionID in $extensions) {
    $regPath = "$regBasePath\$extensionID"

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    Set-ItemProperty -Path $regPath -Name "update_url" -Value $updateURL -Type String
}
