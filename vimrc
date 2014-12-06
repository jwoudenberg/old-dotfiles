" vim:fdm=marker

" Editor {{{
filetype plugin indent on   " enables filetype detection
runtime! macros/matchit.vim " enable matchit
syntax on                   " syntax highlighting
au BufRead,BufNewFile *.md set filetype=markdown " read md files as markdown
set ttyfast
" }}}
" Style {{{
colorscheme molokai
set guifont=Sauce\ Code\ Powerline\ 10
set background=dark
" }}}
" Text editing defaults {{{
set omnifunc=syntaxcomplete#Complete " Enable omni-completion
set completeopt-=preview    " do not show preview window when auto-completing
set laststatus=2            " always display the statusline in all windows
set tabstop=4               " number of spaces in the tab-character
set shiftwidth=4            " number of spaces in indent
set shiftround              " Round indent to multiples of shiftwidth.
set expandtab               " expand a tab into spaces
set smarttab                " remove tabs when backspacing
set number                  " show line numbers
set encoding=utf-8          " set encoding
set showtabline=2           " always show tabs in gvim, but not in vim
set splitbelow              " add new splits below current window
set splitright              " add new splits to the right of current window
set scrolloff=1             " always keep a line above and below the cursor
set incsearch               " highlight search term while typing
set hlsearch                " Highlight search results
set history=1000            " remember more old commands
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')               " start plugin manager
Plug 'mileszs/ack.vim'                          " Grep alternative
Plug 'miyakogi/conoline.vim'                    " Hightlights active line
Plug 'kien/ctrlp.vim'                           " Fuzzy file searcher
Plug 'Raimondi/delimitMate'                     " Automatic bracker closing
Plug 'editorconfig/editorconfig-vim'            " Settings based on .editorconfig file
Plug 'tpope/vim-fugitive'                       " GIT integration
Plug 'haya14busa/incsearch.vim'                 " Improved incremental searching
Plug 'ervandew/supertab'                        " Tab completion
Plug 'scrooloose/syntastic'                     " Syntax checking
Plug 'godlygeek/tabular'                        " Table formatting
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }    " JS code analysis
Plug 'tpope/vim-unimpaired'                     " Miscellaneous commands
Plug 'tpope/vim-abolish'                        " Working with variants of a world
Plug 'bling/vim-airline'                        " Hip status bar
Plug 'tpope/vim-commentary'                     " (Un)commenting lines
Plug 'Lokaltog/vim-easymotion'                  " Additional motions
Plug 'ajh17/vim-fist'                           " Easy creation of Github gists
Plug 'airblade/vim-gitgutter'                   " Column with line changes
Plug 'pangloss/vim-javascript'                  " Better javascript support
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install', 'on': 'JSContextColor' }     " Context coloring for javascript
Plug 'leshill/vim-json'                         " Better JSON support
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }  " Live markdown parsing
Plug 'terryma/vim-multiple-cursors'             " Sublime-like multiple cursors
Plug 'mustache/vim-mustache-handlebars'         " Better support for mustache and handlebars files.
Plug 'moll/vim-node'                            " Better support for node modules
Plug 'tpope/vim-repeat'                         " Use dot operator with plugins
Plug 'tpope/vim-surround'                       " Commands to work with surroundings
Plug 'tpope/vim-vinegar'                        " Directory overview in a panel
call plug#end()

let g:delimitMate_expand_cr=1                   " expand enters
let g:SuperTabDefaultCompletionType="context"   " SuperTab decides which type of completion to use
let g:airline_powerline_fonts=1                 " automatically add airline symbols
let g:airline#extensions#tabline#enabled=1      " use airline tabs
let g:airline_theme="powerlineish"              " airline theme
let g:fist_anonymously=0                        " Gists are published under my name
" }}}
" Keyboard {{{
" Easy movement between windows
let mapleader=" "
let maplocalleader="\\"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Clear highlighted search results
nnoremap <silent> <leader>c :nohlsearch<CR>
map <Leader> <Plug>(easymotion-prefix)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <Leader>m :call LivedownPreview()<CR>
" }}}
" Mouse {{{
set mouse=a
" }}}
" Hooks {{{
autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
" }}}
