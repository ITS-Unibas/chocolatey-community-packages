$ErrorActionPreference = 'Stop';

$packageName = 'ilastik'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.1rc2-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = '4b492588fb001ac61c783b39645d754db86f4f756441ab3ea2bd02b0fb84195f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Set icon in appwiz
$ilastikFolder = Get-ChildItem "C:\Program Files\" | Where-Object { $_.PSIsContainer -eq $true -and $_.Name -match "ilastik" } | ForEach-Object { $_.FullName }
New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ilastik_is1' -Name 'DisplayIcon' -PropertyType String -Value "$ilastikFolder\ilastik.exe" -Force -ErrorAction SilentlyContinue
