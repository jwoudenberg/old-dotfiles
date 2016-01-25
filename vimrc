" vim:fdm=marker

" General {{{1
filetype plugin indent on   " enables filetype detection
runtime! macros/matchit.vim " enable matchit
syntax on                   " syntax highlighting
set ttyfast
set backspace=2

" Text editing defaults {{{1
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set laststatus=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set number
set encoding=utf-8
set splitbelow
set splitright
set scrolloff=1
set incsearch
set hlsearch
set history=1000
set ignorecase
set smartcase

" Plugins {{{1
call plug#begin('~/.vim/plugged')                               " start plugin manager
Plug 'airblade/vim-gitgutter'                                   " Column with line changes
Plug 'ajh17/vim-fist'                                           " Easy creation of Github gists
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } " Context coloring for javascript
Plug 'dag/vim-fish'                                             " Syntax highlighting for fish files
Plug 'easymotion/vim-easymotion'                                " Simple vertical movements
Plug 'editorconfig/editorconfig-vim'                            " Settings based on .editorconfig file
Plug 'ElmCast/elm-vim'                                          " Elm language syntac
Plug 'ervandew/supertab'                                        " Tab completion
Plug 'evanmiller/nginx-vim-syntax'                              " Syntax highlighting for nginx files
Plug 'haya14busa/incsearch.vim'                                 " Improved incremental searching
Plug 'itchyny/lightline.vim'                                    " Status bar
Plug 'jiangmiao/auto-pairs'                                     " Automatic bracket closing
Plug 'junegunn/fzf'                                             " Fuzzy file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                                        " Distraction free writing mode
Plug 'junegunn/vim-easy-align'                                  " Alignment commands
Plug 'kassio/neoterm'                                           " Neovim terminal helpers
Plug 'leshill/vim-json'                                         " Better JSON support
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }            " JS code analysis
Plug 'moll/vim-node'                                            " Better support for node modules
Plug 'morhetz/gruvbox'                                          " Colorscheme
Plug 'mustache/vim-mustache-handlebars'                         " Better support for mustache and handlebars files
Plug 'mxw/vim-jsx'                                              " Hightlight JSX
Plug 'nelstrom/vim-qargs'                                       " Quickfix list entries in args list
Plug 'nelstrom/vim-visual-star-search'                          " Easily search for the selected text
Plug 'pangloss/vim-javascript'                                  " Better javascript support
Plug 'scrooloose/syntastic'                                     " Syntax checking
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }  " Live markdown parsing
Plug 'terryma/vim-multiple-cursors'                             " Sublime-like multiple cursors
Plug 'tpope/vim-abolish'                                        " Working with variants of a world
Plug 'tpope/vim-commentary'                                     " (Un)commenting lines
Plug 'tpope/vim-fugitive'                                       " GIT integration
Plug 'tpope/vim-jdaddy'                                         " JSON manipulation commands
Plug 'tpope/vim-repeat'                                         " Use dot operator with plugins
Plug 'tpope/vim-speeddating'                                    " Manipulation of date strings
Plug 'tpope/vim-surround'                                       " Commands to work with surroundings
Plug 'tpope/vim-unimpaired'                                     " Miscellaneous commands
Plug 'tpope/vim-vinegar'                                        " Directory overview in a panel
Plug 'vim-scripts/syntaxudev.vim'                               " Syntax highlighting for udev rules files
call plug#end()

let g:AutoPairsFlyMode = 1                                      " Autoclose interverning brackets
let g:js_context_colors_enabled=0                               " Do no use js context colors by default
let g:fzf_layout = { 'window': 'enew' }                         " fzf panes take over the current window
let g:syntastic_javascript_checkers = ['eslint']                " Check js files with eslint
let g:syntastic_check_on_wq = 0                                 " Don't check when exiting VIM.
let g:SuperTabDefaultCompletionType="context"                   " SuperTab decides which type of completion to use
let g:fist_anonymously=0                                        " Gists are published under my name
let g:EditorConfig_exclude_patterns = ['.git/COMMIT_EDITMSG']   " in commit message, do not use editorconfig plugin
let g:lightline = { 'colorscheme': 'gruvbox' }                  " Lightline theme matches color scheme
set shell=/bin/bash                                             " required by gitgutter plugin
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Style {{{1
set guifont=Sauce\ Code\ Powerline\ 10
set background=dark
colorscheme gruvbox

" Mappings {{{1
let mapleader=" "
let maplocalleader="\\"

" Easy movement between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Smarter redraw
nnoremap <silent> <leader>c :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Perform fuzzy file searching
nnoremap <C-P> :Files<CR>
nnoremap <C-B> :Buffers<CR>

" Easy vertical movement
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)

" Aligning
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Hightlight all incremental search results
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

" Terminal mappings
nnoremap <silent> <leader>t :Ttoggle<cr>
tnoremap <silent> <leader>t <C-\><C-n>:Ttoggle<cr>
tnoremap <C-[> <C-\><C-n>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>

" Autocmds {{{1
autocmd FileType markdown nnoremap <localleader>m :LivedownToggle<cr>
autocmd FileType javascript nnoremap <localleader>c :JSContextColorToggle<cr>
autocmd FileType elm setlocal tabstop=4 | setlocal shiftwidth=4 | setlocal makeprg=elm-make\ --warn\ --output\ elm.js\ %
autocmd BufWritePost *.elm silent execute "!elm-format --yes %" | edit! | set filetype=elm
autocmd BufRead,BufNewFile *.md set filetype=markdown    " read md files as markdown
autocmd BufRead,BufNewFile *.sjs set filetype=javascript " read sweet.js macro files as javascript
autocmd WinEnter term://* startinsert

" Mouse {{{1
set mouse=a

" Hooks {{{1
autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
