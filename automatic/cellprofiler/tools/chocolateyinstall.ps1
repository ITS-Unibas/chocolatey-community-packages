$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.2.4.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler*'
  checksum       = '3d8104b43c76596c41ce807d2fbc249d12a2d29b55d65aa4ee12ddb773b8257e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
