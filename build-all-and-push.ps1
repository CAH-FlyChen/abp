Function push_obj ($path)
{
    $pack_path = (Join-Path $path "\bin\debug\")
    Set-Location $pack_path
    Remove-Item *.nupkg
	Set-Location $path
    dotnet pack
    Write-Host("pack path:"+$pack_path)
	Set-Location $pack_path
	dotnet nuget push -s http://114.242.17.184:8000/nuget -k ee28314c-f7fe-2550-bd77-e09eda3d0119 *.nupkg
}


# COMMON PATHS

$rootFolder = (Get-Item -Path "./" -Verbose).FullName

# List of solutions

$frameworkPath = "framework/src","modules"



# Build all solutions

foreach ($projectPath in $frameworkPath) {    
    $fullProjectPath = (Join-Path $rootFolder $projectPath)
    Write-Host ("full path is : " + $fullProjectPath)
	$files = Get-ChildItem -Path $fullProjectPath -Include *.csproj -Recurse
	foreach($f in $files)
	{
		$folderPath=Split-Path $f
		push_obj($folderPath)
	}
}
