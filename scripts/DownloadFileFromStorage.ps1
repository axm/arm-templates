param (
    [Parameter(Mandatory = $true)]
    [string]
    $connectionString,
    [Parameter(Mandatory = $true)]
    [string]
    $containerName,
    [Parameter(Mandatory = $true)]
    [string]
    $blobName,
    [Parameter(Mandatory = $true)]
    [string]
    $destination
)

az storage blob download --container-name $containerName `
    --file $destination `
    --name $blobName `
    --connection-string $connectionString

if ($LASTEXITCODE -ne 0) {
    Write-Error "Unable to download blob"
    exit(-1)
}
