# WSL Install
wsl --install -d ubuntu
wsl --set-default-version 2


# Check if Scoop is installed
try {
    scoop | Out-Null
} catch {
    # Install Scoop
    iwr -useb get.scoop.sh | iex
}

# Install git
scoop install main/git

# Add Scoop buckets
$requiredBuckets = @('extras', 'main', 'nonportable')
foreach ($bucket in $requiredBuckets) {
    if (-not (scoop bucket list | findstr /C:$bucket)) {
        scoop bucket add $bucket
    }
}

#update scoop
scoop update

# Install required applications with scoop
$appsToInstall = @('komorebi', 'extras/windows-terminal', 'autohotkey', 'versions/autohotkey1.1', 'git-credential-manager',
                   'chezmoi', 'googlechrome',
                   'https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json', 'gcc', 'go', 
                   '7zip', 'fzf', 'extras/powertoys', 'quicklook', 'main/nodejs', 'extras/openvpn-connect',
                   'nonportable/sql-server-management-studio-np', 'neovim', 'neofetch', 'rust', 'python')
foreach ($app in $appsToInstall) {
    scoop install $app
}

#Install Powershell .Net Core version
winget install --id Microsoft.Powershell --source winget

# Install Icloud with winget
winget install 9PKTQ5699M62

# Configure git
git config --global user.name "Kierian"
git config --global user.email "kierianheffron25@gmail.com"

# Configure ssh
ssh-keygen -t rsa -b 4096 -C "kierianheffron25@gmail.com"

# Ensure ~\.config\chezmoi exists
if (-not (Test-Path "~\.config\chezmoi")) {
    New-Item -ItemType Directory -Force -Path "~\.config\chezmoi"
}

# Create chezmoi.toml
Set-Content -Path "~\.config\chezmoi\chezmoi.toml" -Value @"
[git]
autoCommit = true
autoPush = true
"@

# Install lf
$env:CGO_ENABLED = '0'
go install -ldflags="-s -w" github.com/gokcehan/lf@latest

# Install thokr
cargo install thokr

# Update pip
python -m pip install -U pip

# Install chatblade
pip install 'chatblade @ git+https://github.com/npiv/chatblade
pip install chatblade --upgrade

# Clone Dotfiles
chezmoi init --apply KierianH
