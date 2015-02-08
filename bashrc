#!/bin/sh

# Customize the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1)\n\[\033[01;34m\]$\[\033[00m\] '
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

# Load a local configuration
[ -f ~/.localrc ] && source ~/.localrc

# set path
export PATH="${PATH}:/home/jasper/scripts:/home/jasper/.cabal/bin:/home/jasper/.npm-global/bin:/home/jasper/.gem/ruby/2.1.0/bin"
export EDITOR=vim xterm

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
alias la='ls -lAXh --color=always'
alias ll='ls --color=auto -Flh'
alias la='ls -lAXh --color=always'
alias vimrc='$EDITOR ~/.vimrc'
alias bashrc='$EDITOR ~/.bashrc'

# start x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
