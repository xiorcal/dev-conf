param([string]$target = '')

if($target != ''){
  [environment]::setEnvironmentVariable('SCOOP','C:\dev\stuff','User')
}

set-executionpolicy unrestricted -s cu
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')


# utils
scoop install 7zip curl sudo git openssh coreutils grep sed less touch gzip vim

# languages
scoop install go scala sbt openjdk

scoop bucket add extras

# tools
scoop install pandoc plantuml vscode vlc keepass firefox

echo "Raf : cloudstation, keepass-http"
