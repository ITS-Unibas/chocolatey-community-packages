Import-Module chocolatey-au

function global:au_GetLatest {
    $BaseURL = 'https://www.cgl.ucsf.edu'
    $chimeraXPage = $BaseURL + '/chimerax/data/release-info/production.json'

    $downloadPage = Invoke-WebRequest -Uri $chimeraXPage -UseBasicParsing
    $json = $downloadPage.Content | ConvertFrom-Json
    $version = $json.windows.version
    $link = $json.windows.link
	$filename = ($link -split "/")[-1]

    $URI = $BaseURL + '/chimerax/cgi-bin/secure/chimerax-get.py?file=' + $link + '&choice=Accept'
	
	$intermediate = Invoke-WebRequest $URI -UseBasicParsing

    $result = $intermediate.Links | where {$_.href -match ('/.*chimerax-get.py.*' + $filename)}

    $url = ($BaseURL + $result.href)

    return @{ 
        Version = $version
        URL64 = $url
    }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64\s*=\s*)('.*')"      = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}


update -ChecksumFor 64
