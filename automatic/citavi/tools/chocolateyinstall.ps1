$ErrorActionPreference = 'Stop';


$packageName = 'citavi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://setup1.citavi.com/release/default/Citavi6Setup.msi'
  #file         = $fileLocation

  #MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  # optional, highly recommended
  softwareName   = 'Citavi*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'b6eed3d655da578b0d3af0cd3a72462bb747524a08e9c70f34fda674f3f908e8'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
