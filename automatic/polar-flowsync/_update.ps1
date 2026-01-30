Import-Module chocolatey-au

# update script disabled weil wir die choco community edition nutzen

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://support.polar.com/en/updates/polar-flowsync-version-4-for-windows-and-mac'

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

  $download_page.Content -match "Version number: (\d+\.\d+\.\d+)" | Out-Null
  #https://flowsync.flow.polar.com/app/FlowSync_installer-4.0.11-x86-x64.exe
  $version = $Matches[0] -replace '.*:\s*', ''

  $url = "https://flowsync.flow.polar.com/app/FlowSync_installer-$($version)-x86-x64.exe"

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor all -NoCheckChocoVersion
