#!/bin/fish

# Set vi keybindings.
fish_vi_key_bindings

# No greeting message.
set fish_greeting

# Set environment variables.
set -x EDITOR nvim

# Set aliases.
alias vimrc "$EDITOR ~/.config/nvim/init.vim"
alias vim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias nvim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias todo "$EDITOR ~/docs/todo.txt"

function fish_mode_prompt
    # overwrite the default fish_mode_prompt to show nothing.
end

# Configure fzf
set -x FZF_DEFAULT_COMMAND 'rg --files'

set -x MANPAGER "/bin/sh -c \"unset MANPAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

set -x GPG_TTY (tty)

# The ale vim plugin requires this.
if not set -q TMPDIR
    set -gx TMPDIR /tmp
end

# Configure nri env
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
chruby ruby-2.3.3
source ~/.set-aws-env.fish

set -gx PATH ~/.local/bin /Users/jasper/.stack/programs/x86_64-osx/ghc-8.0.2/bin/ $PATH
