$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.2.0.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler*'
  checksum       = '05e3af13d6548673b5cd2be840d9b48b962719794834d6b601ba06ec38c71937'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
