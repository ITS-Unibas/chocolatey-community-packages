$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler-analyst'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Analyst-Windows-3.0.1.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler-Analyst*'
  checksum       = '74b2fd40c8e13fbca7cf5b014091bee26d89af84391c62369ac3da7954d76007'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
