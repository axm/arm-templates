param (
    [Parameter(Mandatory = $true)]
    [string]
    $connectionString,
    [Parameter(Mandatory = $true)]
    [string]
    $containerName,
    [Parameter(Mandatory = $true)]
    [string]
    $destination
)

az storage blob download-batch --source $containerName `
    --destination $destination `
    --connection-string $connectionString `
    --pattern *.response.json

if ($LASTEXITCODE -ne 0) {
    Write-Error "Unable to download blob"
    exit(-1)
}
