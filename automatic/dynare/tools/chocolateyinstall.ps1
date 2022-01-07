$ErrorActionPreference = 'Stop';

$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.dynare.org/release/windows/dynare-5.0-win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  # optional, highly recommended
  softwareName   = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'dad6d2e07c4eb6d2fd3eecdd01ec8fc4b210ca992590b8fdad6e630860edf972'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
