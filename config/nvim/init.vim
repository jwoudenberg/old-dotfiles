" vim:fdm=marker

" General {{{1
filetype plugin indent on
runtime! macros/matchit.vim
syntax on
set ttyfast
set backspace=2
set termguicolors
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
set cursorline
set hidden
set nowrap
set inccommand=nosplit
set mouse=a

" Plugins {{{1
call plug#begin('~/.vim/plugged')
Plug 'Olical/vim-enmasse'                                       " Editable quickfix list
Plug 'Shougo/deoplete.nvim'                                     " Code completion
Plug 'airblade/vim-gitgutter'                                   " Column with line changes
Plug 'ajh17/vim-fist'                                           " Easy creation of Github gists
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } " Context coloring for javascript
Plug 'bronson/vim-visual-star-search'                          " Easily search for the selected text
Plug 'dag/vim-fish'                                             " Syntax highlighting for fish files
Plug 'editorconfig/editorconfig-vim'                            " Settings based on .editorconfig file
Plug 'elentok/todo.vim'                                         " Todo.txt support
Plug 'elixir-lang/vim-elixir'                                   " Elixer support
Plug 'elmcast/elm-vim'                                          " Elm language syntac
Plug 'elzr/vim-json'                                            " Better JSON support
Plug 'evanmiller/nginx-vim-syntax'                              " Syntax highlighting for nginx files
Plug 'haya14busa/incsearch.vim'                                 " Improved incremental searching
Plug 'itchyny/lightline.vim'                                    " Status bar
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'                                             " Fuzzy file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                                        " Distraction free writing mode
Plug 'junegunn/gv.vim'                                          " Git commit browser
Plug 'junegunn/vim-easy-align'                                  " Alignment commands
Plug 'justinmk/vim-dirvish'                                     " File explorer
Plug 'justinmk/vim-sneak'                                       " Medium-range motion
Plug 'kassio/neoterm'                                           " Neovim terminal helpers
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }            " JS code analysis
Plug 'moll/vim-node'                                            " Better support for node modules
Plug 'morhetz/gruvbox'                                          " Colorscheme
Plug 'mustache/vim-mustache-handlebars'                         " Better support for mustache and handlebars files
Plug 'mxw/vim-jsx'                                              " Hightlight JSX
Plug 'pangloss/vim-javascript'                                  " Better javascript support
Plug 'qpkorr/vim-bufkill'                                       " Kill a buffer without closing its window
Plug 'scrooloose/syntastic'                                     " Syntax checking
Plug 'tommcdo/vim-lion'                                         " Alignment commands
Plug 'tpope/vim-abolish'                                        " Working with variants of a world
Plug 'tpope/vim-commentary'                                     " (Un)commenting lines
Plug 'tpope/vim-eunuch'                                         " Unix commands
Plug 'tpope/vim-fugitive'                                       " GIT integration
Plug 'tpope/vim-jdaddy'                                         " JSON manipulation commands
Plug 'tpope/vim-repeat'                                         " Use dot operator with plugins
Plug 'tpope/vim-sleuth'                                         " Detect indent style from a file
Plug 'tpope/vim-speeddating'                                    " Manipulation of date strings
Plug 'tpope/vim-surround'                                       " Commands to work with surroundings
Plug 'tpope/vim-unimpaired'                                     " Miscellaneous commands
Plug 'vim-scripts/CursorLineCurrentWindow'                      " Only show the cursorline in the active window
Plug 'vim-scripts/syntaxudev.vim'                               " Syntax highlighting for udev rules files
call plug#end()

let g:AutoPairsFlyMode = 1
let g:deoplete#enable_at_startup = 1
let g:EditorConfig_exclude_patterns = ['.git/COMMIT_EDITMSG']
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:fist_anonymously=0
let g:fzf_layout = { 'window': 'enew' }
let g:js_context_colors_enabled=0
let g:lightline = { 'colorscheme': 'gruvbox' }
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings = 0
set shell=/bin/bash                                             " required by gitgutter plugin

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

" Aligning
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Hightlight all incremental search results
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

" Terminal mappings
nnoremap <silent> <C-T> :Ttoggle<cr>
tnoremap <silent> <C-T> <C-\><C-n>:Ttoggle<cr>
tnoremap <C-[> <C-\><C-n>
tnoremap <C-O> <C-\><C-n><C-o>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>

" Autocmds {{{1
augroup customCommands
  autocmd!
  autocmd FileType markdown nnoremap <localleader>m :LivedownToggle<cr>
  autocmd FileType javascript nnoremap <localleader>c :JSContextColorToggle<cr>
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.sjs set filetype=javascript
  autocmd FileType dirvish setlocal nonumber
  autocmd WinEnter term://* startinsert
  autocmd BufLeave *;#FZF silent! BD!
  " Sort files in buffer, but keep the cursor on the file we came from.
  autocmd FileType dirvish let b:dirvish['currentLine']=getline('.') |
    \ sort ir /^.*[^\/]$/ |
    \ keepjumps call search('\V\^'.escape(b:dirvish['currentLine'],'\').'\$', 'cw')
  autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
augroup END
