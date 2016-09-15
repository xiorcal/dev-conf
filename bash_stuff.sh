#####################
###### VARS #########
#####################

export NO_PROXY=localhost

#####################
###### CONF #########
#####################


#####################
##### STUFF #########
#####################
function openTunnel {
  local tunnelName=$1
  local localPort=$2
  local remoteHost=$3
  local remotePort=$4

  nc -nz 127.0.0.1 $localPort
  if [ $? -ne 0 ]; then
    echo "Establishing a tunnel to $remoteHost:$remotePort ($tunnelName) on the local port $localPort..."
    ssh -NfL $localPort:$remoteHost:$remotePort $(whoami)@bigdatabatch03g.be3.local
  fi
}
function tunnels {
  grep "openTunnel" ~/dev/scripts/pj.sh | while read -r line ; do
    args=$(echo $line | xargs -n 1)
    printf "%s\n" "$(echo $args|sed '2q;d') ($(echo $args|sed '4q;d'):$(echo $args|sed '5q;d')) on $(echo $args|sed '3q;d')"
  done
}
function openTunnel {

}
function editprofile
{
  atom $CONF_HOME/bash_stuff.sh ~/.bash_aliases ~/dev/scripts/pj.sh &
}

function git_oops
{
  git add "$@"
  git commit --amend -C HEAD
}
alias git_double_oops='git reset --soft HEAD@{1}'

function git_force_reset
{
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git fetch origin
    git reset --hard origin/master
    git clean -fdx
  fi
}

function git_grep
{
  # Liste des repertoires sans leurs sous-repertoires
  repos="$(find * -type d -prune)"

  # Pour chaque repo, recherche dans les log la chaine demandée
  for repo in ${repos}; do
    cd ${repo}
    echo ${repo}
    git leditp  og --grep=$1
    cd ..
  done
}

function gss
{
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  git stash save "$branch_name - working"
}

function plantuml
{
  filename=$1
  java -jar ~/apps/plantuml.jar $filename
  filename="${filename%.*}"
  xdg-open ${filename}.png
}

function eclipse
{
  $ECLIPSE_HOME/eclipse &
}


function lycos
{
  find . -name "$1"
}

function merguez
{
  ps -edf | grep $1
}


HISTTIMEFORMAT="[%F %T] "
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


#####################
###### ALIAS ########
#####################
alias vi='vim'
alias w='thunar . &'
alias b='cd -'
alias fuuuu='sudo $(history -p \!\!)'
alias fuu='fuuuu'
alias fuuu='fuuuu'
alias fuuuuu='fuuuu'
alias cls='clear'
alias psgrep='merguez'
alias gsp='git stash pop'
alias lll='ll'
