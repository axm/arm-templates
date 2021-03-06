param (
	[Parameter()]
	[string]
	$imageName="python-http",
	[Parameter(Mandatory=$true)]
	[string]
	$tag
)

docker build -t "axmacr.azurecr.io/$($imageName):$tag" .
