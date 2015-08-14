#!/bin/fish

# Set vi keybindings.
fish_vi_mode

# No greeting message.
set fish_greeting

# Set aliases.
alias lock "xscreensaver-command --lock"
alias xclip "xclip -selection clipboard"
alias vimrc "$EDITOR ~/.vimrc"
alias vim "nvim"

# Make NVM available.
function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

# And run it immediately to set npm and node commands.
nvm use current > /dev/null

function fish_mode_prompt
    # overwrite the default fish_mode_prompt to show nothing.
end
