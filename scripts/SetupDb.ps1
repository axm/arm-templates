$server = ""
$database = ""
$username = ""
$password = ""
$scriptPath = ""

& .\scripts\DownloadFileFromStorage.ps1 -connectionString $cs `
    -containerName $cn `
    -blobName $bn `
    -destination $scriptPath

& .\scripts\ExecuteSqlFile.ps1 -sqlFilPath $scriptPath `
    -server $server `
    -database $database `
    -username $username `
    -password $password

$snapshotName = "base"

$createSnapshot = @"
CREATE DATABASE $snapshotName
ON
(
	NAME = $database,
	FILENAME ='C:\Scripts\initsnapshot.ss'
)
AS SNAPSHOT OF $database;
"@

Invoke-Sqlcmd -ServerInstance $server `
    -Database $database `
    -Query $createSnapshot

$restoreSnapshot = @"
ALTER DATABASE $database SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
GO

USE master;
RESTORE DATABASE $database FROM DATABASE_SNAPSHOT = '$base';
GO

ALTER DATABASE $database SET MULTI_USER
GO
"@


Invoke-Sqlcmd -ServerInstance $server `
    -Database $database `
    -Query $createSnapshot
