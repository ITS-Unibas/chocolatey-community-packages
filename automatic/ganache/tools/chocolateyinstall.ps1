$ErrorActionPreference = 'Stop';


$packageName = 'ganache'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://github.com/trufflesuite/ganache/releases/download/v2.5.4/Ganache-2.5.4-win-setup.exe'
  silentArgs     = '/S /ALLUSERS=1'
  softwareName   = 'Ganache*'
  checksum64     = 'b7e4ec85691aabcc57156c15dddbb0ecba46a71e5507cb6ac673cf04874e9748'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
