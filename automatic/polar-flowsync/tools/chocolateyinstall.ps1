$ErrorActionPreference = 'Stop';

$packageName = 'polar-flowsync'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://flowsync.cdn.polar.com/connect/download/FlowSync_3.0.0.1337.exe'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'Polar FlowSync*'
  checksum       = '404631183cb271e45bca369a11103a012c44718e94ca701d4a4976111176513c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
