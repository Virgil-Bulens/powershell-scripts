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
# Enforce strict mode
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Log Start
Write-Verbose -Message "Script started."

# Authentication
Connect-MgGraph -Identity -NoWelcome
Connect-AzAccount -Identity | Out-Null
#endregion


#region 3 - Process
try
{

}
catch
{
    Write-Error $_.Exception.Message
}
#endregion


#region 4 - End
Write-Verbose -Message "Script finished."
#endregion
