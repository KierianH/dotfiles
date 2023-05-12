# WinDotfiles

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

## Clone Dotfiles
`chezmoi init --apply KierianH
