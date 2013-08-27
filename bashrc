export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '
source /usr/share/git/completion/git-prompt.sh
set -o vi
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
