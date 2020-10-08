$ErrorActionPreference = 'Stop';


$packageName = 'dynare'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://www.dynare.org/release/windows/dynare-4.6.2-win.exe'
  #file         = $fileLocation
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  silentArgs    = '/S'           # NSIS
  #silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"' # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s -u'        # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
  #       https://chocolatey.org/packages/autohotkey.portable
  #validExitCodes= @(0) #please insert other valid exit codes here

  # optional, highly recommended
  softwareName  = 'Dynare*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'b8c042c30f429b8e3f554053779fc9448dc53d0788877731e3831e76265163a9'
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
