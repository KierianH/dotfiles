# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Oh My Posh
oh-my-posh init pwsh --config C:\Users\Kieri\Documents\Powershell\kierian.omp.json | Invoke-Expression

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
