$ErrorActionPreference = 'Stop';

$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.dynare.org/release/windows/dynare-6.2-win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  # optional, highly recommended
  softwareName   = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '8bce245273206063ca7738768be0336dce7e7edfa99034a06393f35b1b42da4e'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
