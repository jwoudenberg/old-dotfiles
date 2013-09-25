#!/bin/sh

# Customize the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1) \[\033[01;34m\]$\[\033[00m\] '
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

# Set vim-keybindings
set -o vi

# set aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lock='xscreensaver-command --lock'
alias unzip='7z e'
alias xclip='xclip -selection clipboard'
alias gim='gvim'
alias gitl='git log --graph --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'

# start x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
