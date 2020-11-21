$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.0.7.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler*'
  checksum       = '17616704bd8b95df137f21cd5f1505099b23f9670182055279b61903d9d1955a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
