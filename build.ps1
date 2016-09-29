echo Downloading packages...

$package = "jquery.validate.unobtrusive"
$version = "5.2.3"

if (-not (Test-Path nuget.exe)) {
	wget -OutFile nuget.exe https://dist.nuget.org/win-x86-commandline/v3.3.0/nuget.exe
}

mkdir pkg\lib
mkdir pkg\tools
mkdir pkg\content
mkdir pkg\content\Scripts
mkdir pkg\content\Scripts\jQuery-Validation-Unobtrusive

wget -OutFile "pkg\content\Scripts\jQuery-Validation-Unobtrusive\$package.js" "http://ajax.aspnetcdn.com/ajax/mvc/$version/$package.js"
wget -OutFile "pkg\content\Scripts\jQuery-Validation-Unobtrusive\$package.min.js" "http://ajax.aspnetcdn.com/ajax/mvc/$version/$package.min.js"

echo Building NuGet package...

.\nuget.exe pack pkg\jQuery-Validation-Unobtrusive.NuGet.nuspec

