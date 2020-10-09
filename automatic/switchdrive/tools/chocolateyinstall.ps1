$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = 'https://misc.www.switch.ch/drive/SWITCHdrive-2_5_4_1832.msi'
  silentArgs     = 'MSIRESTARTMANAGERCONTROL=Disable ALLUSERS=1 REBOOT=ReallySuppress /qn'
  validExitCodes = @(0)

  softwareName   = 'SWITCHdrive*'
  checksum       = '442f452c4ddcc7f7bc81eb9a292ce509cc3637d4f313dbd5e6b8565825f745b9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
