$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler-analyst'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-org.s3.amazonaws.com/CellProfiler-Analyst-stable.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler-Analyst*'
  checksum       = '571ef8da653503840bbcb087b538e07f306a56c710df3ff881d8b59734ec1c25'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
