$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = 'https://misc.www.switch.ch/drive/SWITCHdrive-2_5_4_1832.msi'
  silentArgs     = '/S'
  validExitCodes = @(0)

  softwareName   = 'SWITCHdrive*'
  checksum       = '195723a33ba2624cc87ddffc76525428'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
