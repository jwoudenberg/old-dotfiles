# Customize the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '
source /usr/share/git/completion/git-prompt.sh

# Set vim-keybindings
set -o vi

# Set aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lock='xscreensaver-command --lock'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo shutdown -r now'
alias unzip='7z e'

# Start x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
