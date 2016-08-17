#!/bin/fish

# Set vi keybindings.
fish_vi_key_bindings

# No greeting message.
set fish_greeting

# Set aliases.
alias lock "xscreensaver-command --lock"
alias xclip "xclip -selection clipboard"
alias vimrc "$EDITOR ~/.config/nvim/init.vim"
alias vim "nvim"
alias nvim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias todo "$EDITOR ~/docs/todo.txt"

# And run it immediately to set npm and node commands.
nvm use (nvm version current) > /dev/null

function fish_mode_prompt
    # overwrite the default fish_mode_prompt to show nothing.
end

# Configure fzf
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

set -x MANPAGER "/bin/sh -c \"unset MANPAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
