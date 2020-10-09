$ErrorActionPreference = 'Stop';

$packageName = 'polar-flowsync'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = ''
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'Polar FlowSync*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
