$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler-analyst'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Analyst-Windows-3.0.4.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler-Analyst*'
  checksum       = 'a999f086a0e4da532eda62e44efa24b07f90e793823e11904a933c6b16729ec0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
