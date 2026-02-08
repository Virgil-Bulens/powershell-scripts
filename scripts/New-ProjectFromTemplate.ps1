function New-ProjectFromTemplate {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ProjectName,
        
        [Parameter(Mandatory=$false)]
        [string]$RemoteUrl
    )
    
    $templateRepo = "https://github.com/Virgil-Bulens/repo-template.git"
    $ErrorActionPreference = "Stop"
    Set-StrictMode -Version Latest
    
    # Clone template
    git clone $templateRepo $ProjectName
    
    # Navigate to new directory
    Set-Location $ProjectName
    
    # Remove template git history
    Remove-Item -Recurse -Force .git
    
    # Initialize new repo
    git init
    git add .
    git commit -m "Initial commit from template"
    
    # Add remote if provided
    if ($RemoteUrl) {
        git remote add origin $RemoteUrl
    }
    
    Write-Host "Project '$ProjectName' created"
}
