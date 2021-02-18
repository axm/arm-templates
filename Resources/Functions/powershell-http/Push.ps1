param (
	[Parameter()]
	[string]
	$imageName="powershell-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker push "axmacr.azurecr.io/$($imageName):$tag"
