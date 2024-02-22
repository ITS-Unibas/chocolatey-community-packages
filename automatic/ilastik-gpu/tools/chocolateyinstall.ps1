$ErrorActionPreference = 'Stop';

$packageName = 'ilastik-gpu'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.0.post1-gpu-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = 'eb948f5207e8324452d4b142a6dec5b9dbc93eb6ef28e681cb73dbb49b0a5f3d'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
