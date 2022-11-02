Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://api.github.com/repos/trufflesuite/ganache-ui/releases'
$matching = 'win-setup.exe$'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'ganache'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $Splat = @{
      Method      = 'GET'
      Uri         = $releases
  }
  $download_page = Invoke-RestMethod @Splat -ErrorAction Stop
  $results = ($download_page | Where {$_.prerelease -eq $false})[0]
  $url = $results.assets.browser_download_url | Where {$_ -match $matching}

  $arr = $url -split '-|.exe'
  $version = $arr[2]
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
