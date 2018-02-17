#!/bin/fish

# Set vi keybindings.
fish_vi_key_bindings

# No greeting message.
set fish_greeting

# Set aliases.
alias lock "xscreensaver-command --lock"
alias xclip "xclip -selection clipboard"
alias vimrc "$EDITOR ~/.config/nvim/init.vim"
alias vim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias nvim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias todo "$EDITOR ~/docs/todo.txt"
alias nri "$EDITOR ~/docs/nri"

# And run it immediately to set npm and node commands.
nvm use (nvm version current) > /dev/null

function fish_mode_prompt
    # overwrite the default fish_mode_prompt to show nothing.
end

# Rebound Ctrl behaves as Escape
xcape -e 'Control_L=Control_L|Escape'

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

set -gx PATH ~/.local/bin /Users/jasper/.stack/programs/x86_64-osx/ghc-8.0.2/bin/ $PATH

function __change-colors --on-event fish_postexec --description 'Maybe change colorscheme'
    status --is-command-substitution
    and return
    new-colors
end

# Configure fish to use standard terminal colors
set -U fish_color_autosuggestion cyan
set -U fish_color_command blue
set -U fish_color_comment magenta
set -U fish_color_cwd blue
set -U fish_color_cwd_root blue
set -U fish_color_end cyan
set -U fish_color_error red
set -U fish_color_escape 'bryellow' '--bold'
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator bryellow
set -U fish_color_param cyan
set -U fish_color_quote magenta
set -U fish_color_redirection cyan
set -U fish_color_search_match 'bryellow' '--background=brblack'
set -U fish_color_selection 'white' '--bold' '--background=brblack'
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
