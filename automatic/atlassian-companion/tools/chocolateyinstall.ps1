$ErrorActionPreference = 'Stop';

$packageName = 'atlassian-companion'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/win32/ia32/Atlassian%20Companion.msi'

  #MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:SWP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  #OTHERS
  softwareName   = 'atlassian-companion*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'f95fc9ad091958a2dd960db0e4eac86d9d266e7e67f2c4d28053105ca4aebb6d'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
