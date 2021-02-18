param (
	[Parameter()]
	[string]
	$imageName="python-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker push "axmacr.azurecr.io/$($imageName):$tag"
