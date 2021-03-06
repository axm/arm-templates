param (
	[Parameter()]
	[string]
	$imageName="dotnet-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker build -t "axmacr.azurecr.io/$($imageName):$tag" .
