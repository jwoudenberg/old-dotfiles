#!/bin/bash

# Customize the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1)\n\[\033[01;34m\]$\[\033[00m\] '
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

# set path
export PATH="${PATH}:./node_modules/.bin:/home/jasper/scripts:/home/jasper/.cabal/bin:/home/jasper/.gem/ruby/2.2.0/bin:/home/jasper/.local/bin"
export EDITOR=nvim
export BROWSER=/usr/bin/chromium

# Set vim-keybindings
set -o vi

# start x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export NVM_DIR="/home/jasper/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
