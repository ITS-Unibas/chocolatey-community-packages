$ErrorActionPreference = 'Stop';

$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.dynare.org/release/windows/dynare-5.5-win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  # optional, highly recommended
  softwareName   = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'c2fdb68f2e858d882854c7bd6037b0d0dd31a59d2367cf0a5db9253625f0a7dc'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
