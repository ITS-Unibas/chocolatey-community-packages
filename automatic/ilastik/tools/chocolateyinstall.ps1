$ErrorActionPreference = 'Stop';

$packageName = 'ilastik'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.0.post1-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = '7ac96e0597d4db7b6d1924800e081688e9f4394335078d04f60c6eda41b6607f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Set icon in appwiz
$ilastikFolder = Get-ChildItem "C:\Program Files\" | Where-Object { $_.PSIsContainer -eq $true -and $_.Name -match "ilastik" } | ForEach-Object { $_.FullName }
New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ilastik_is1' -Name 'DisplayIcon' -PropertyType String -Value "$ilastikFolder\ilastik.exe" -Force -ErrorAction SilentlyContinue
