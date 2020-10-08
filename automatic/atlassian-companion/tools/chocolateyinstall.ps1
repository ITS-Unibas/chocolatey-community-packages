
$ErrorActionPreference = 'Stop';


$packageName = 'atlassian-companion'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/win32/ia32/Atlassian%20Companion.msi'
  #file         = $fileLocation

  #MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:SWP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  #OTHERS

  # optional, highly recommended
  softwareName   = 'atlassian-companion*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '0b407eceadd07f367048fb9a13fb7de07d748551cfde34ad593b6816dea50060'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
