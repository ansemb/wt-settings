# win settings
windows terminal and powershell settings

### (1) installation

#### (1.1) install packages/modules:
```
winget install --id Microsoft.Powershell --source winget
winget install --id gerardog.gsudo --source winget
winget install --id Git.Git -e --source winget
winget install --id Rustlang.Rustup --source winget
winget install --id Starship.Starship --source winget
winget install --id CoreyButler.NVMforWindows --source winget
winget install ajeetdsouza.zoxide
```
#### other:
```
winget install --id KeePassXCTeam.KeePassXC --source winget
winget install --id Microsoft.PowerToys --source winget
winget install --id Python.Python.3.10 --source winget
winget install --id 7zip.7zip --source winget
winget install --id Microsoft.VisualStudioCode --source winget
```

- [alacritty](https://alacritty.org/)
- [helix](https://docs.helix-editor.com/)

#### [wsl](https://learn.microsoft.com/en-us/windows/wsl/install), run powershell as admin:
```
wsl --install
wsl --install -d Ubuntu
```
reboot system.

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
dotfiles submodule update --init --recursive
dotfiles pull --recurse-submodules --jobs=10
```
#### (2.3) create symlink
```
New-Item $HOME\Documents\PowerShell -ItemType Directory -ea 0
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue $HOME\Documents\PowerShell\profile.ps1
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\profile.ps1" -Target "$HOME\.config\powershell\profile.ps1"
exit
```

## install font
download font at [NerdFont](https://www.nerdfonts.com/font-downloads):
- [DejaVuSansMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip)
