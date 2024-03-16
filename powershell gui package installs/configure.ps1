##### packages
### choco
#Get-ExecutionPolicy
#Set-ExecutionPolicy AllSigned
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))                      
### winget

### tools


## Networking
winget install --source msstore --force --accept-package-agreements --accept-source-agreements putty realvnc sysinternals
## Embedded
winget install --source msstore --force --accept-package-agreements --accept-source-agreements arduino
## Programming
choco install vim neovim

winget install --source msstore --force --accept-package-agreements --accept-source-agreements powertoys python3 rufus trello powershell draw.io sysinternals terminal devtoys 

winget install --source winget  --force --accept-package-agreements --accept-source-agreements notion

## Music
winget install --source msstore --force --accept-package-agreements --accept-source-agreements volumey spotify deezer tidal soundcloud mixx audacity obs 
## Multimedia
winget install --source msstore --force --accept-package-agreements --accept-source-agreements gimp obs blender audacity express inkscape fresco clipchamp vlc treesize anki heic heif avc capcut canva paint
## system
winget install --source msstore --force --accept-package-agreements --accept-source-agreements treesize heic heif avc recuva crystaldiskinfo
## Social
winget install --source msstore --force --accept-package-agreements--accept-source-agreements whatsapp netflix discord reddit wikipedia
## Networking 
winget install --source msstore --force --accept-package-agreements--accept-source-agreements teams zoom outlook skype oneNote trello webex linkedin 
## Gaming
winget install --source msstore --force --accept-package-agreements--accept-source-agreements  epic discord obs ubisoft qbittorrent dolby
## Academic
winget install --source msstore --force --accept-package-agreements--accept-source-agreements  deepL wikipedia 

