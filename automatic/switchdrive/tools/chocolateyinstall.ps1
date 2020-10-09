$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = ''
  silentArgs     = 'MSIRESTARTMANAGERCONTROL=Disable ALLUSERS=1 REBOOT=ReallySuppress /qn'
  validExitCodes = @(0)

  softwareName   = 'SWITCHdrive*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
