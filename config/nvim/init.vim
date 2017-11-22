" Five steps to get started:

" (1) Copy this file to ~/.config/nvim/init.vim

" (2) Replace this with a path to brangelina on your machine.
source ~/dev/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  " (3) Add your custom plugins below.
  Plug 'dracula/vim'
  Plug 'parsonsmatt/intero-neovim'
call plug#end()

" (4) Configure the theme you want to use below.
colorscheme dracula
let g:lightline.colorscheme = 'Dracula'
set background=dark
let g:neoterm_shell = 'fish'
set colorcolumn=81
let g:intero_use_neomake=0
" (5) Enjoy using branglina.vim. Issues and pull requests are welcome!
