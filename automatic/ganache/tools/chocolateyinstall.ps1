$ErrorActionPreference = 'Stop';


$packageName = 'ganache'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://github.com//trufflesuite/ganache/releases/download/v2.4.0/Ganache-2.4.0-win-setup.exe'
  silentArgs     = '/S /ALLUSERS=1'
  softwareName   = 'Ganache*'
  checksum64     = '8725b1c4d99baf57e0a82cb3ae0bbfeb85345991281550f64f3ab4a04389c91f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
