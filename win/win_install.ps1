param([string]$target = '')

if ($target -ne '') {
  [environment]::setEnvironmentVariable('SCOOP', $target, 'User')
}

set-executionpolicy unrestricted -s cu
Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')


# utils
scoop install 7zip curl sudo git openssh coreutils grep sed less touch gzip vim

# languages
scoop install go openjdk scala sbt

scoop bucket add extras

# tools
scoop install pandoc plantuml vscode vlc keepass firefox

Write-Output "Raf : cloudstation, keepass-http"
