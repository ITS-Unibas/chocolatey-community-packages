
$ErrorActionPreference = 'Stop';


$packageName = 'ganache'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = ''
  silentArgs     = '/S /ALLUSERS=1'
  softwareName   = 'Ganache*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = ''
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
