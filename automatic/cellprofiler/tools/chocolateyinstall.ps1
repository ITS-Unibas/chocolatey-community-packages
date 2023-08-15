$ErrorActionPreference = 'Stop';

$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.2.6.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'Cellprofiler*'
  checksum       = '723c76d0e431782be3c6f8098a77f4a51bb4d0400fb322656f1f8c8df9091892'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
