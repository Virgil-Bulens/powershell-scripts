<#
.SYNOPSIS
{Short description of the script.}

.DESCRIPTION
{More detailed description of the script.}

.EXAMPLE
{example usage}
#>

function New-PowershellScript
{
#region 1 - Parameters
[CmdletBinding()]
param(
    [Parameter()]
    [switch]
    $VerboseMode,

    # Name for the new script
    [Parameter(Mandatory = $true)]
    [string]
    $Name
)
#endregion


#region 2 - Begin
begin
{
    # Variables
    $templateUrl = "https://raw.githubusercontent.com/Virgil-Bulens/powershell-scripts/refs/heads/main/templates/powershellTemplate.ps1"

    # Enforce strict mode
    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop"

    # Log Function
    function Write-Log
    {
        param(
            [Parameter(Mandatory = $true)]
            [ValidateSet("INFO", "WARN", "ERROR")]
            [string]
            $Level,
            
            [Parameter(Mandatory = $true)]
            [string]
            $Message
        )
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Write-Output "$timestamp [$Level] $Message"
    }

    Write-Log -Level INFO -Message "Script started."
}
#endregion


#region 3 - Process
process
{
    try 
    {
        # Download the content of the template
        $Content = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/Virgil-Bulens/powershell-scripts/refs/heads/main/templates/powershellTemplate.ps1"

        # Write the file
        New-Item -Path "./$($Name).ps1" `
          -ItemType File `
          -Value $Content
        
    } 
    catch 
    {
        Write-Log -Level ERROR -Message $_.Exception.Message
        throw
    }
}
#endregion


#region 4 - End
end
{
    Write-Log -Level INFO -Message "Script finished."
}
#endregion
}
