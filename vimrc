execute pathogen#infect()
filetype plugin indent on   " enables filetype detection

syntax on                   " syntax highlighting
colorscheme molokai

set guifont=droid\ sans\ mono\ for\ powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2            " always display the statusline in all windows
set tabstop=4               " number of spaces in the tab-character
set shiftwidth=4            " number of spaces in indent
set expandtab               " expand a tab into spaces
set number                  " show line numbers
set encoding=utf-8          " set encoding
set showtabline=2           " always show tabs in gvim, but not in vim

map <F2> :NERDTreeTabsToggle<CR>
