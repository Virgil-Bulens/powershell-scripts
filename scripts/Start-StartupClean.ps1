#
# Variables
#
$ErrorActionPreference = "Stop"
$DownloadFolder = "$env:USERPROFILE\Downloads\"


#
# Main
#
# Clean Download folder
Get-ChildItem -Path $DownloadFolder `
    -Recurse `
    -Force | `
    Remove-Item -Recurse `
    -Force

# Get OneDrive folder
$OneDriveFolder = Get-ChildItem -Path $env:USERPROFILE | `
    Where-Object Name -Like "*OneDrive*"

# Get Desktop folder
$DesktopFolder = Get-ChildItem -Path $OneDriveFolder.FullName | `
    Where-Object Name -EQ "Desktop"

# Clean Desktop
Get-ChildItem -Path $DesktopFolder.FullName `
    -Recurse `
    -Force | `
    Where-Object Name -NE "FUCK OFF.lnk" | `
    Remove-Item -Recurse `
    -Force

# Clean Public Desktop
Get-ChildItem -Path "$env:PUBLIC\Desktop" `
    -Recurse `
    -Force | `
    Remove-Item -Recurse `
    -Force