$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64            = 'https://www.cgl.ucsf.edu/chimerax/cgi-bin/secure/chimerax-get.py?ident=OHeQer2VSrp4%2BOpyoXFc5ftxvkdcRNz91BNw0RTjgPYtqOo%3D&file=1.12%2Fwindows%2FChimeraX-1.12.exe&choice=Notified'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  softwareName   = 'UCSF ChimeraX*'
  checksum64       = '45a8368cd8bee1218973bf615248c306303e61ead1fc29fa052fe0e22bd22177'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
