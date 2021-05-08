$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler-analyst'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Analyst-Windows-3.0.2.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler-Analyst*'
  checksum       = '477a5f598695659b83d22af62dd86fa31040302d521f165a0040452d4fff6ab7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
