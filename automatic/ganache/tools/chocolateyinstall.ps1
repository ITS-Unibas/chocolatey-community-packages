$ErrorActionPreference = 'Stop';


$packageName = 'ganache'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://github.com/trufflesuite/ganache-ui/releases/download/v2.7.1/Ganache-2.7.1-win-x64-setup.exe'
  silentArgs     = '/S /ALLUSERS=1'
  softwareName   = 'Ganache*'
  checksum64     = 'f0b3e398e3e910cb27762a23a4ba0f6e998d3ce2d2ccbeccea42e54849273571'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
