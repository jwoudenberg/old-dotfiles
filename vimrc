execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on   " enables filetype detection
set omnifunc=syntaxcomplete#Complete

syntax on                   " syntax highlighting
colorscheme molokai

set guifont=Inconsolata\ 10
set laststatus=2            " always display the statusline in all windows
set tabstop=4               " number of spaces in the tab-character
set shiftwidth=4            " number of spaces in indent
set expandtab               " expand a tab into spaces
set number                  " show line numbers
set encoding=utf-8          " set encoding
set showtabline=2           " always show tabs in gvim, but not in vim

let mapleader=","
let g:nerdtree_tabs_open_on_gui_startup=0   " do not automatically open NERDTreeTabs
let g:airline_powerline_fonts=1             " automatically add airline symbols
let g:airline_theme="powerlineish"          " airline theme
let g:JSHintUpdateWriteOnly=1               " update jshint only when writing

map <F2> :NERDTreeTabsToggle<CR>

autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
