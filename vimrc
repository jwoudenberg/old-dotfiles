" vim:fdm=marker

" General {{{1
filetype plugin indent on   " enables filetype detection
runtime! macros/matchit.vim " enable matchit
syntax on                   " syntax highlighting
set ttyfast
set backspace=2

" Text editing defaults {{{1
set omnifunc=syntaxcomplete#Complete " Enable omni-completion
set completeopt-=preview    " do not show preview window when auto-completing
set laststatus=2            " always display the statusline in all windows
set tabstop=2               " number of spaces in the tab-character
set shiftwidth=2            " number of spaces in indent
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

" Plugins {{{1
call plug#begin('~/.vim/plugged')                               " start plugin manager
Plug 'airblade/vim-gitgutter'                                   " Column with line changes
Plug 'ajh17/vim-fist'                                           " Easy creation of Github gists
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } " Context coloring for javascript
Plug 'bling/vim-airline'                                        " Hip status bar
Plug 'dag/vim-fish'                                             " Syntax highlighting for fish files
Plug 'easymotion/vim-easymotion'                                " Simple vertical movements
Plug 'editorconfig/editorconfig-vim'                            " Settings based on .editorconfig file
Plug 'ervandew/supertab'                                        " Tab completion
Plug 'evanmiller/nginx-vim-syntax'                              " Syntax highlighting for nginx files
Plug 'godlygeek/tabular'                                        " Table formatting
Plug 'haya14busa/incsearch.vim'                                 " Improved incremental searching
Plug 'jiangmiao/auto-pairs'                                     " Automatic bracket closing
Plug 'junegunn/fzf'                                             " Fuzzy file searching
Plug 'junegunn/fzf.vim'
Plug 'lambdatoast/elm.vim'                                      " Elm language syntac
Plug 'leshill/vim-json'                                         " Better JSON support
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }            " JS code analysis
Plug 'moll/vim-node'                                            " Better support for node modules
Plug 'mustache/vim-mustache-handlebars'                         " Better support for mustache and handlebars files
Plug 'mxw/vim-jsx'                                              " Hightlight JSX
Plug 'nelstrom/vim-visual-star-search'                          " Easily search for the selected text
Plug 'NLKNguyen/papercolor-theme'                               " Nice color scheme
Plug 'pangloss/vim-javascript'                                  " Better javascript support
Plug 'rking/ag.vim'                                             " Fast grep replacement
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
let g:airline_powerline_fonts=1                                 " automatically add airline symbols
let g:airline#extensions#tabline#enabled=1                      " use airline tabs
let g:airline_theme="papercolor"                                " airline theme
let g:fist_anonymously=0                                        " Gists are published under my name
let g:ctrlp_custom_ignore = '\.git$\|node_modules'              " skip directories in ctrlp indexing
let g:EditorConfig_exclude_patterns = ['.git/COMMIT_EDITMSG']   " in commit message, do not use editorconfig plugin
set shell=/bin/bash                                             " required by gitgutter plugin
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Style {{{1
set guifont=Sauce\ Code\ Powerline\ 10
set background=light
colorscheme PaperColor

" Mappings {{{1
let mapleader=" "
let maplocalleader="\\"
" Easy movement between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Clear highlighted search results
nnoremap <silent> <leader>c :nohlsearch<CR>
" Open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Perform fuzzy file searching
nnoremap <C-P> :Files<CR>
nnoremap <C-B> :Buffers<CR>
map <leader> <plug>(easymotion-prefix)
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

" Abbreviations {{{1
ab fn function

" Autocmds {{{1
autocmd FileType markdown nnoremap <localleader>m :LivedownToggle<CR>
autocmd FileType javascript nnoremap <localleader>c :JSContextColorToggle<CR>
autocmd BufRead,BufNewFile *.md set filetype=markdown    " read md files as markdown
autocmd BufRead,BufNewFile *.sjs set filetype=javascript " read sweet.js macro files as javascript

" Mouse {{{1
set mouse=a

" Hooks {{{1
autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
