param (
    [Parameter(Mandatory=$true)]
    [string]
    $server,
    [Parameter(Mandatory=$true)]
    [string]
    $login,
    [Parameter(Mandatory=$true)]
    [securestring]
    $password
)

$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $login, $password

Add-SqlLogin `
    -LoginName $login `
    -Credential $credential `
    -LoginType SqlLogin `
    -Enable `
    -GrantConnectSql `
    -ServerInstance $server `
    -EnforcePasswordPolicy `
    -EnforcePasswordExpiration:$false  `
    -MustChangePasswordAtNextLogin:$false
