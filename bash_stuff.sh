#####################
###### VARS #########
#####################
dev=~/dev
proj=$dev/audience-stream
export NO_PROXY=localhost
#####################
###### CONF #########
#####################
stty -ixon


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



# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


export PS1='\[$(tput bold)\]\[\033[38;5;202m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;211m\]${newPWD}\[\033[38;5;15m\]]$(__git_ps1 " \[\033[1;34m\]{%s}")\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;10m\]>> \[\033[38;5;15m\]'

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
