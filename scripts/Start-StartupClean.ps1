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
