Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$apiEndpoint = "https://api.github.com"
$releases = "$apiEndpoint/repos/trufflesuite/ganache-ui/releases"

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
      Headers     = @{
        "Accept" = "application/vnd.github.v3+json" 
      }
  }
  
  $download_page = Invoke-RestMethod @Splat -ErrorAction Stop
  $results = ($download_page | Where-Object {$_.prerelease -eq $false})[0]
  $matching = 'win-x64-setup.exe$'
  $url = $results.assets.browser_download_url | Where-Object {$_ -match $matching}

  $arr = $url -split '-|.exe'
  $version = $arr[2]
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
