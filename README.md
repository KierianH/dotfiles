# WinDotfiles

## WSL2 Setup
Run PS as admin
`wsl --install`

`wsl --set-default-version 2`

# Windows Set Up Steps
## Install Scoop
`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time`

`irm get.scoop.sh | iex`

## Install Chezmoi
`scoop install chezmoi`

## Clone Dotfiles
`chezmoi init --apply KierianH
