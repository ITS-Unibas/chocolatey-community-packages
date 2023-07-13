$ErrorActionPreference = 'Stop';

$packageName = 'ilastik-gpu'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.0-gpu-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = '91c80c1601e7ac439ba73a79b7b7cfcf23e6b216c2627fbd4ac852e7c161ec8f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
