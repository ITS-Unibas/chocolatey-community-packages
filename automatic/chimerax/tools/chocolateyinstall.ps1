$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64            = 'https://www.cgl.ucsf.edu/chimerax/cgi-bin/secure/chimerax-get.py?ident=OHeQer2WTaZn%2F%2BputnhL4%2BBpv1BVQtjx1Rlx1A%2FhnvEpqe7EdSI%3D&file=1.11.1%2Fwindows%2FChimeraX-1.11.1.exe&choice=Notified'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  softwareName   = 'UCSF ChimeraX*'
  checksum64       = 'fd165b6fd3ee17e034d126d9bb2b29fc83be8e9a3ee860c8d74d9018634a7294'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
