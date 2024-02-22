$ErrorActionPreference = 'Stop'

$AppVersion = '1.7.1'
$AppVersionShort = $AppVersion -replace '.\d$'

$BaseURL = 'https://www.cgl.ucsf.edu'

# Discovering download link
$url = "$BaseURL/chimerax/cgi-bin/secure/chimerax-get.py"
$PostParams = @{
   choice='Accept'
   file="$AppVersionShort/windows/ChimeraX-$AppVersion.exe"
}
$DownloadPage = Invoke-WebRequest $url -method Post -Body $postparams -UseBasicParsing

$URLstub = ($DownloadPage.content.split() | Where-Object {$_ -match 'href='}) -replace '.*href="(.*)".*','$1'

Write-Host 'You are establishing a license agreement as defined here:' -ForegroundColor Cyan
Write-Host 'http://www.cgl.ucsf.edu/chimerax/license.html' -ForegroundColor Cyan

$packageArgs = @{
   packageName    = $env:ChocolateyPackageName
   fileType       = 'EXE'
   url64bit       = $BaseURL + $URLstub
   softwareName   = 'UCSF ChimeraX*' 
   checksum64     = 'cc9b4af4e1a04fc647d082e04f60c111c7aeed12ebcf00d146bbf970bfcbd3d7'
   checksumType64 = 'sha256'
   silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
   validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
