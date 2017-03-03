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

plugins=(git httpie jsontools sudo notification command-not-found zsh-syntax-highlighting) #zsh-syntax-highlighting must be last!
source $ZSH/oh-my-zsh.sh

znotify[on_complete]='notify-send "${command_name} ended" "elapsed $formatted_elapsed_time." --icon=dialog-information -t 0'
znotify[threshold]="15" # sec

DEFAULT_USER="mlacroix"

source ~/dev/linux-conf/bash_stuff.sh
source ~/dev/scripts/pj.sh
source ~/.bash_aliases

bindkey \^U backward-kill-line

# ignore commands starting by " "
setopt HIST_IGNORE_SPACE

zmodload zsh/datetime
