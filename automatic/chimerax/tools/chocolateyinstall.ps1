$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64            = 'https://www.cgl.ucsf.edu/chimerax/cgi-bin/secure/chimerax-get.py?ident=OHeQer2WTaZn%2F%2BVotntA5eBouVBVQtjx1xp53wvhnvYoo%2BrKciE%3D&file=1.11%2Fwindows%2FChimeraX-1.11.exe&choice=Notified'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  softwareName   = 'UCSF ChimeraX*'
  checksum64       = '46d79196b375c63b26e3604b358b9cb9d8fdfa292902aeb07e03eb508e3b29c0'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
