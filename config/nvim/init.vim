" Five steps to get started:

" (1) Copy this file to ~/.config/nvim/init.vim

" (2) Replace this with a path to Brangelina on your machine.
source ~/dev/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  " (3) Add your custom plugins below.
  Plug 'dracula/vim'
  Plug 'junegunn/gv.vim'                     "  Git commit browser
  Plug '~/dev/elm.vim'
call plug#end()

" (4) Configure the theme you want to use below.
colorscheme dracula
let g:lightline.colorscheme = 'Dracula'
set background=dark
let g:neoterm_shell = 'fish'
set colorcolumn=81
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_rust = []
let g:neoformat_enabled_sql = []
let g:neoformat_enabled_yaml = []
let g:neoformat_enabled_json = []
set spell spelllang=en_us
" (5) Enjoy using branglina.vim. Issues and pull requests are welcome!
