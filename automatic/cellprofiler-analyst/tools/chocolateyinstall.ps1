$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler-analyst'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Analyst-Windows-3.0.0.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler-Analyst*'
  checksum       = '54287d4d398201921f5aa7862df1b471662a37e8b4905359ddc39d877c04c5e7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
