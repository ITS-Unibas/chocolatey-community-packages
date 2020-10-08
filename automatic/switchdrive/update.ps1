import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://help.switch.ch/drive/downloads/#collapse-80e712df-6688-11e4-b6ef-5254009dc73c-1'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'switchdrive'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'md5'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '.msi$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $arr = $url -split '-|.msi'
  $version = $arr[1].replace("_", ".")
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
