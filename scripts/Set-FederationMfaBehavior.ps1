#
# Parameters
#
param (
    # Behavior
    [Parameter(
        Mandatory = $true,
        Position = 0
    )]
    [string]
    [ValidateSet(
        "acceptIfMfaDoneByFederatedIdp",
        "enforceMfaByFederatedIdp",
        "rejectMfaByFederatedIdp"
    )]
    $Behavior,

    # Domain Name
    [Parameter(
        Mandatory = $true,
        Position = 1
    )]
    [string]
    $DomainName,

    # Internal Domain Federation Id
    [Parameter(
        Mandatory = $true,
        Position = 2
    )]
    [string]
    $InternalDomainFederationId
)


#
# Variables
#
$ErrorActionPreference = "Stop"


#
# Main
#
Connect-AzAccount -WarningAction SilentlyContinue | Out-Null

$Token = Get-AzAccessToken -ResourceTypeName MSGraph

$Headers = @{ 
    'Authorization' = "Bearer $($Token.Token)"
    'content-type'  = "application/json" 
}

$Body = @"
{
    "FederatedIdpMfaBehavior": "$($Behavior)"
}
"@

Invoke-RestMethod -Method Patch `
    -Uri "https://graph.microsoft.com/v1.0/domains/$($DomainName)/federationConfiguration/$($InternalDomainFederationId)" `
    -Headers $Headers `
    -Body $Body