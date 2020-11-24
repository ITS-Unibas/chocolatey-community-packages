$ErrorActionPreference = 'Stop';

$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.dynare.org/release/windows/dynare-4.6.3-win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  # optional, highly recommended
  softwareName   = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '4fcc3be4c7c474143a58c56fefbef2fb7dd6bb0a5ff639c4aa88d706d553487e'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
