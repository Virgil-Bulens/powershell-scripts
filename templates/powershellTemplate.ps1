<#
.SYNOPSIS
{Short description of the script.}

.DESCRIPTION
{More detailed description of the script.}

.EXAMPLE
{example usage}
#>

#region 1 - Parameters
[CmdletBinding()]
param(
)
#endregion


#region 2 - Begin
begin
{
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
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Verbose "$timestamp [$Level] $Message"
    }

    Write-Log -Level INFO -Message "Script started."
}
#endregion


#region 3 - Process
process
{
    try 
    {

    } 
    catch 
    {
        Write-Error $_.Exception.Message
    }
}
#endregion


#region 4 - End
end
{
    Write-Log -Level INFO -Message "Script finished."
}
#endregion
