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

function fish_mode_prompt
    # overwrite the default fish_mode_prompt to show nothing.
end
