Import-Module chocolatey-au

function global:au_GetLatest {
    $BaseURL = 'https://www.cgl.ucsf.edu'
    $chimeraXPage = $BaseURL + '/chimerax/data/release-info/production.json'

    $downloadPage = Invoke-WebRequest -Uri $chimeraXPage -UseBasicParsing
    $json = $downloadPage.Content | ConvertFrom-Json
    $version = $json.windows.version
    $link = $json.windows.link

    $URI = $BaseURL + '/chimerax/cgi-bin/secure/chimerax-get.py'
   
    $body = @{
        'choice' = 'Accept'
        'file'   = $link 
    }

    $result = Invoke-WebRequest $URI -body $body -Method Post -UseBasicParsing

    $url64 = $BaseURL + ($result.links | Select-Object -ExpandProperty href)

    return @{ 
        Version = $version
        URL64 = $url64 -replace '&amp;','&'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]AppVersion = )('.*')"      = "`$1'$($Latest.Version)'"
            "(^\s*Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor 64
