execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on   " enables filetype detection

syntax on                   " syntax highlighting
colorscheme molokai

set guifont=droid\ sans\ mono\ for\ powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2            " always display the statusline in all windows
set tabstop=2               " number of spaces in the tab-character
set shiftwidth=2            " number of spaces in indent
set expandtab               " expand a tab into spaces
set number                  " show line numbers
set encoding=utf-8          " set encoding
set showtabline=2           " always show tabs in gvim, but not in vim

let mapleader=","
let g:nerdtree_tabs_open_on_gui_startup=0 "do not automatically open NERDTreeTabs
let g:UltiSnipsSnippetDirectories=["UltiSnips", "jasperSnips"] "set directories where snippets can be found

map <F2> :NERDTreeTabsToggle<CR>
