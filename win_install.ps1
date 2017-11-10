param([string]$target = '')

if($target != ''){
  [environment]::setEnvironmentVariable('SCOOP','C:\dev\stuff','User')
}

set-executionpolicy unrestricted -s cu
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')


# utils
scoop install 7zip curl sudo git openssh coreutils grep sed less touch gzip vim

# languages
scoop install go scala sbt

scoop bucket add extras
# language
scoop install oraclejdk

# tools
scoop install pandoc vscode vlc keepass firefox

echo "Raf : cloudstation, keepass-http"
