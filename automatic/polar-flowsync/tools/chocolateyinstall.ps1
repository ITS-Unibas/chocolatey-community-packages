$ErrorActionPreference = 'Stop';

$packageName = 'polar-flowsync'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://flowsync.flow.polar.com/app/FlowSync_installer-4.0.11-x86-x64.exe'
  silentArgs     = '/VERYSILENT /NOCANCEL /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'Polar FlowSync*'
  checksum       = '0b24c41eb404ef8e9b1963b852d5dfa907f99d8cf1789cdf55f5c45370bc9abf'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
