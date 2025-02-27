$ErrorActionPreference = 'Stop';

$packageName = 'ilastik-gpu'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.1rc2-gpu-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = '506109e7ec7570aa0f5b43698b03cfd3edac3bb28a47a432e258ec739052b77c'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
