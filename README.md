# win settings
windows terminal and powershell settings

### (1) installation

#### (1.1) open *admin* powershell (**win+x** **a**)

#### (1.2) install package manager [chocolatey](https://chocolatey.org/install):

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### (1.2) install packages/modules:
```
winget install Neovim.Neovim --location C:\tools\neovim # or winget install Neovim.Neovim -i and set installation directory C:\tools\neovim
winget install --id Microsoft.Powershell --source winget
choco install powershell-core -y
choco install nodejs-lts -y
choco install rust -y
choco install starship -y
Install-Module z -AllowClobber -Force
```
#### if python is not installed:
```
choco install python3 -y
```

### (2) repo

#### (2.1) get profile for windows terminal:
```
Invoke-WebRequest https://raw.githubusercontent.com/ansemb/wt-settings/master/profiles.json -OutFile "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

#### (2.2) clone repo
```
cd $HOME
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue $HOME/.dotfiles
git clone --bare https://github.com/ansemb/wt-settings.git $HOME/.dotfiles
function dotfiles { git --git-dir="$HOME\.dotfiles" --work-tree="$HOME" @Args }
dotfiles checkout --force
dotfiles config status.showUntrackedFiles no
rm $HOME/README.md
rm $HOME/profiles.json 
dotfiles update-index --assume-unchanged README.md profiles.json
```
#### (2.3) create symlink
```
New-Item $HOME\Documents\PowerShell -ItemType Directory -ea 0
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue $HOME\Documents\PowerShell\profile.ps1
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\profile.ps1" -Target "$HOME\.config\powershell\profile.ps1"
exit
```

### (3) [lunarvim](https://www.lunarvim.org)
#### (3.1) open powershell core
#### (3.2) install lunarvim:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install.ps1'))
```

## install font
download font at [NerdFont](https://www.nerdfonts.com/font-downloads):
- [DejaVuSansMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip)
