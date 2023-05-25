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
## Install Scoop (Might be able to skip this)
`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time`


## Powershell customization
Install Hack Nerdfont here (specifically the bold one) [https://github.com/ryanoasis/nerd-fonts/releases](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hack.zip)

### Install chatblade -note need admin perms for this
`pip install 'chatblade @ git+https://github.com/npiv/chatblade'`
`pip install chatblade --upgrade`

## Install Rider
Install rider manually for now with jettbrains toolbox

## Set Up Powertoys
Restore from backup in ~/Documents\PowerToys\Backup\ folder

## Set Up Rider
Import Settings stored in ~/.config/rider
