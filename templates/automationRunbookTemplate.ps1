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
# Try/catch to handle local testing vs azure runbook scenarios
try {
    Write-Verbose "Attempting Managed Identity connection..."
    Connect-MgGraph -Identity -NoWelcome
    Connect-AzAccount -Identity -WarningAction Ignore | Out-Null
}
catch {
    Write-Warning "Managed Identity connection failed. Attempting interactive fallback (for local debugging)."
    Connect-MgGraph -NoWelcome
    Connect-AzAccount | Out-Null
}
#endregion


#region 3 - Process
try
{

}
    catch
    {
        $errMessage = "Status: $($_.Exception.Message)"
        try 
        {
            if ($_.Exception.Response)
            {
                $reader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
                $details = $reader.ReadToEnd()
                $errMessage += " | Details: $details"
            }
        }
        catch
        {
            $errMessage += " | Could not read response stream for details."
        }
        throw $errMessage
    }
#endregion


#region 4 - End
Write-Verbose -Message "Script finished."
#endregion
