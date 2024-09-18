$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.2.8.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler*'
  checksum       = 'fb60b2574f19db1171bb45044dd1c01ec3443a025f78ad6f0a7c5fa8e7e88c56'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
