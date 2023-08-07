Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://flow.polar.com/start'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'polar-flowsync'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
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

  $download_page -match 'FlowSync_(\d+\.\d+\.\d+\.\d+)' | Out-Null
  $version = $Matches[1]


  $regex = '.msi$'
  $url = "https://flowsync.cdn.polar.com/connect/download/FlowSync_$($version).exe"

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
