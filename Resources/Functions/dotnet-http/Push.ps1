param (
	[Parameter()]
	[string]
	$imageName="dotnet-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker push "axmacr.azurecr.io/$($imageName):$tag"
