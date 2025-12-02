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

    # Log Start
    Write-Verbose -Message "Script started."
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
    Write-Verbose -Message "Script finished."
}
#endregion
