execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on   " enables filetype detection
set omnifunc=syntaxcomplete#Complete

syntax on                   " syntax highlighting
colorscheme molokai

set guifont=Sauce\ Code\ Powerline\ 9
set laststatus=2            " always display the statusline in all windows
set tabstop=4               " number of spaces in the tab-character
set shiftwidth=4            " number of spaces in indent
set shiftround              " Round indent to multiples of shiftwidth.
set expandtab               " expand a tab into spaces
set smarttab                " remove tabs when backspacing
set relativenumber          " show relative line numbers
set number                  " show line numbers
set encoding=utf-8          " set encoding
set showtabline=2           " always show tabs in gvim, but not in vim
set splitbelow              " add new splits below current window
set splitright              " add new splits to the right of current window
set scrolloff=1             " always keep a line above and below the cursor
set incsearch               " highlight search term while typing

let mapleader=","
let g:nerdtree_tabs_open_on_gui_startup=0   " do not automatically open NERDTreeTabs
let g:airline_powerline_fonts=1             " automatically add airline symbols
let g:airline_theme="powerlineish"          " airline theme
let g:JSHintUpdateWriteOnly=1               " update jshint only when writing

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <Leader> <Plug>(easymotion-prefix)

autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
