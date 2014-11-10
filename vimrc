" vim:fdm=marker

" Editor {{{
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on   " enables filetype detection
runtime! macros/matchit.vim " enable matchit
syntax on                   " syntax highlighting
au BufRead,BufNewFile *.md set filetype=markdown " read md files as markdown
set ttyfast
" }}}
" Style {{{
colorscheme molokai
set guifont=Sauce\ Code\ Powerline\ 10
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
let g:delimitMate_expand_cr=1                   " expand enters
let g:airline_powerline_fonts=1                 " automatically add airline symbols
let g:airline#extensions#tabline#enabled=1      " use airline tabs
let g:airline_theme="powerlineish"              " airline theme
let g:JSHintUpdateWriteOnly=1                   " update jshint only when writing
let g:SuperTabDefaultCompletionType="context"   " SuperTab decides which type of completion to use
let g:fist_anonymously=0                        " Gists are published under my name
" }}}
" Keyboard {{{
" Easy movement between windows
let mapleader=" "
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
" }}}
" Mouse {{{
set mouse=a
" }}}
" Hooks {{{
autocmd BufWritePre * :%s/\s\+$//e  " automatically remove trailing whitespace on writing
" }}}
