Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://confluence.atlassian.com/doc/atlassian-companion-app-release-notes-958455712.html'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'atlassian-companion'
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

  $download_page -match '>Atlassian Companion(.*?)((\d+)\.(\d+)\.(\d+))' | Out-Null
  $version = $Matches[2]


  $regex = '.msi$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
