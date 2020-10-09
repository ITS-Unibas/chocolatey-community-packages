$ErrorActionPreference = 'Stop';

$packageName = 'citavi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = ''
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  # optional, highly recommended
  softwareName   = 'Citavi*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = ''
  checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
