param (
	[Parameter()]
	[string]
	$imageName="powershell-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker build -t "axmacr.azurecr.io/$($imageName):$tag" .
