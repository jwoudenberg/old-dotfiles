#!/bin/sh

# Customize the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1)\n\[\033[01;34m\]$\[\033[00m\] '
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh

# set path
PATH="${PATH}:/home/jasper/scripts:/home/jasper/.cabal/bin:/home/jasper/.npm-global/bin"

# Set vim-keybindings
set -o vi

# set aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lock='xscreensaver-command --lock'
alias xclip='xclip -selection clipboard'
alias gim='gvim'
alias gitl='git log --graph --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'
alias chrome='google-chrome-stable'

# start x
[[ -z $display && $xdg_vtnr -eq 1 ]] && exec startx
