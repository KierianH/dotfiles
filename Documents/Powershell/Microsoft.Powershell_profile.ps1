# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Oh My Posh
oh-my-posh init pwsh --config ~/OMPThemes/rudolfs-dark.omp.json| Invoke-Expression
#Modules
#Install-Module z
#Install-Module posh-git
#Install-Module Terminal-Icons
#Install-Module PsFzf

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Komorebi configs location
$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\Kieri\.config\komorebi'

#Aliases
Set-Alias grep findstr
Set-Alias chez chezmoi
Set-Alias kom komorebic
Set-Alias vim nvim
Set-Alias zip Compress-Archive
Set-Alias unzip Expand-Archive
Set-Alias download Download-File
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ai chatblade
Set-Alias lf lfcd

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Download-File {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Url,

        [Parameter(Mandatory = $true, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string]$OutputPath
    )

    $response = Invoke-WebRequest -Uri $Url -UseBasicParsing
    $response.Content | Set-Content -Path $OutputPath -Encoding Byte
}

#Set up ssh keys if they aren't already
# $sshKeyPath = "$env:USERPROFILE\.ssh\id_rsa"
# if (-not (Test-Path -Path $sshKeyPath)) {
#     ssh-keygen -t rsa -b 4096 -f $sshKeyPath
# }

function PublishWindows {
    dotnet publish -c Release --self-contained true -r win-x64 --output ./Notes/Release/windows-x64 --framework net7.0 /p:PublishSingleFile=true /p:PublishTrimmed=true
}
function PublishLinux {
    dotnet publish -c Release --self-contained true -r linux-x64 --output ./Notes/Release/linux-x64 --framework net7.0 /p:PublishSingleFile=true /p:PublishTrimmed=true
}
function PublishMac {
    dotnet publish -c Release --self-contained true -r osx-x64 --output ./Notes/Release/macos-x64 --framework net7.0 /p:PublishSingleFile=true /p:PublishTrimmed=true
}
function PublishMacArm {
    dotnet publish -c Release --self-contained true -r osx-arm64 --output ./Notes/Release/macos-arm64 --framework net7.0 /p:PublishSingleFile=true /p:PublishTrimmed=true
}
function PublishLinuxArm {
    dotnet publish -c Release --self-contained true -r linux-arm --output ./Notes/Release/linux-arm --framework net7.0 /p:PublishSingleFile=true /p:PublishTrimmed=true
}

#This function makes it so that when we use lf we exit the current dir
function LFCD {
    $tmp = [System.IO.Path]::GetTempFileName()
    cmd /c lf -last-dir-path="$tmp" $args
    if (Test-Path -PathType Leaf "$tmp") {
        $dir = Get-Content "$tmp"
        Remove-Item -Force "$tmp"
        if (Test-Path -PathType Container "$dir") {
            if ("$dir" -ne "$pwd") {
                cd "$dir"
            }
        }
    }
}

