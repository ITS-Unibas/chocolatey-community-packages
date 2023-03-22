$ErrorActionPreference = 'Stop';

$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.dynare.org/release/windows/dynare-5.4-win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  # optional, highly recommended
  softwareName   = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'ef5874321e2d3a34ca73ee57ee9e9311c0b07bd4b0a87fbd7faf89dab9fee37f'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
