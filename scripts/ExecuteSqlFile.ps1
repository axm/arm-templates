param (
    [Parameter(Mandatory=$true)]
    [string]
    $sqlFilPath,
    [Parameter(Mandatory=$true)]
    [string]
    $server,
    [Parameter(Mandatory=$true)]
    [string]
    $database,
    [Parameter(Mandatory=$true)]
    [string]
    $username,
    [Parameter(Mandatory=$true)]
    [string]
    $password
)

Invoke-Sqlcmd -InputFile $sqlFilPath -ServerInstance $server -Database $database -Username $username -Password $password
