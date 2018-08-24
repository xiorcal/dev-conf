#!/usr/bin/zsh
export TERM="xterm-256color"
#Path to your oh-my-zsh installation.
export ZSH=/home/mlacroix/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)

# zsh-syntax-highlighting must be last! IMPORTANT
plugins=(git httpie jsontools sudo notification command-not-found rust cargo golang python virtualenv virtualenvwrapper zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

znotify[on_complete]='notify-send "${command_name} ended" "elapsed $formatted_elapsed_time." --icon=dialog-information'
znotify[threshold]="15" # sec

DEFAULT_USER="mlacroix"

source ~/dev/misc/linux-conf/bash_stuff.sh
source ~/dev/misc/scripts/pj.sh
source ~/.bash_aliases

bindkey \^U backward-kill-line

# ignore commands starting by " " for history
setopt HIST_IGNORE_SPACE

zmodload zsh/datetime

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
