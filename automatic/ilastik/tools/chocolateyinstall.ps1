$ErrorActionPreference = 'Stop';

$packageName = 'ilastik'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.3.3post3-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = 'af3495be3236ef6837dcc7a84ecd4690c184fd13c7a7b585431837e1b2c8cd6f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Set icon in appwiz
$ilastikFolder = Get-ChildItem "C:\Program Files\" | Where-Object { $_.PSIsContainer -eq $true -and $_.Name -match "ilastik" } | ForEach-Object { $_.FullName }
New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ilastik_is1' -Name 'DisplayIcon' -PropertyType String -Value "$ilastikFolder\ilastik.exe" -Force -ErrorAction SilentlyContinue
