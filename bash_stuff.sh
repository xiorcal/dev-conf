#####################
###### VARS #########
#####################
dev=~/dev
proj=$dev/audience-stream

#####################
###### CONF #########
#####################
stty -ixon


#####################
##### STUFF #########
#####################
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

function gss
{
  branch_name=`git rev-parse --abbrev-ref HEAD`
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
  ps aux | grep $1
}


export PS1='\[$(tput bold)\]\[\033[38;5;202m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;211m\]${newPWD}\[\033[38;5;15m\]]$(__git_ps1 " \[\033[1;34m\]{%s}")\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;10m\]>> \[\033[38;5;15m\]'

#####################
###### ALIAS ########
#####################
alias vi='vim'
alias w='thunar .'
alias b='cd -'
alias fuuuu='sudo $(history -p \!\!)'
alias fuu='fuuuu'
alias fuuu='fuuuu'
alias fuuuuu='fuuuu'
alias cls='clear'
alias psgrep='merguez'
alias gsp='git stash pop'
alias lll='ll'
