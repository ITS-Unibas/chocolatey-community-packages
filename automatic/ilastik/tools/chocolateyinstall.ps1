$ErrorActionPreference = 'Stop';

$packageName = 'ilastik'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://files.ilastik.org/ilastik-1.4.0rc6-win64.exe'
  silentArgs     = '/VERYSILENT /NORESTART /NOCANCEL'
  validExitCodes = @(0)
  softwareName   = 'ilastik*'
  checksum64     = '95002abf7eef161bba6cee7b2f03fc1f8caa33fa09dec627647c43cf884312d7'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Set icon in appwiz
$ilastikFolder = Get-ChildItem "C:\Program Files\" | Where-Object { $_.PSIsContainer -eq $true -and $_.Name -match "ilastik" } | ForEach-Object { $_.FullName }
New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ilastik_is1' -Name 'DisplayIcon' -PropertyType String -Value "$ilastikFolder\ilastik.exe" -Force -ErrorAction SilentlyContinue
