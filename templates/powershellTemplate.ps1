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
}
#endregion


#region 4 - End
end
{
    Write-Verbose -Message "Script finished."
}
#endregion
