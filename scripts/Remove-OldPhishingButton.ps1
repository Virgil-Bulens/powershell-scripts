if ( Test-Path -Path "Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\4A12C2A9595FB09FBCF568EE4DB7551F6BBC2EFE" )
{
    Remove-Item -Path "Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\4A12C2A9595FB09FBCF568EE4DB7551F6BBC2EFE" `
        -Recurse `
        -Force
}

if ( Test-Path -Path "Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\Outlook\Addins\MetaCompliance.Reporter.Email" )
{
    Remove-Item -Path "Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\Outlook\Addins\MetaCompliance.Reporter.Email" `
        -Recurse `
        -Force
}