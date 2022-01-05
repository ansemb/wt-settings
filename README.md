# wt-settings
windows terminal settings

### (1) install

#### (1.1) open *admin* powershell (**win+x** **a**)

#### (1.2) install package manager [chocolatey](https://chocolatey.org/install):

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### (1.2) install packages:
```
choco install microsoft-windows-terminal
choco install powershell-core
choco install neovim --pre 
exit
```

### (2) get profiles

#### (2.1) open powershell (**win+x** **i**) / powershell core

#### (2.2) get profile for windows terminal:
```
Invoke-WebRequest https://raw.githubusercontent.com/ansemb/wt-settings/master/profiles.json -OutFile "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

### (3) clone repo
#### 

```
cd ~
git clone --bare https://github.com/ansemb/wt-settings.git
rm ~/README.md ~/profiles.json 
```

## install font
download font at [NerdFont](https://www.nerdfonts.com/font-downloads)
