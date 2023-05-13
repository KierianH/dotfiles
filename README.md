## WSL2 Setup
Run PS as admin
`wsl --install`

`wsl --set-default-version 2`

`sudo apt-get update`

`sudo apt-get install python3 python3-pip`

`pip3 install ansible`

## Install Ansible

`sudo apt install ansible`

The playbooks can be found in this repo https://github.com/KierianH/Ansible/tree/main

`ansible-playbook playbook.yml`

# Windows Set Up Steps
## Install Scoop
`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time`

`irm get.scoop.sh | iex`

## Install Chezmoi
`scoop install chezmoi`

In ~\.config\chezmoi create chezmoi.toml with this content
``` 
[git]
    autoCommit = true
    autoPush = true
```

## Powershell customization
Install Hack Nerdfont here (specifically the bold one) [https://github.com/ryanoasis/nerd-fonts/releases](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hack.zip)

Install Powershell (.NET Core Version) `winget install Microsoft.PowerShell`

Install Oh-My-Posh

`scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json`

## Misc Program

`scoop install gcc`

`scoop install neovim`



## Clone Dotfiles
`chezmoi init --apply KierianH
