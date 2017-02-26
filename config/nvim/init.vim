" Five steps to get started:

" (1) Copy this file to ~/.config/nvim/init.vim

" (2) Replace this with a path to brangelina on your machine.
source ~/projects/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  " (3) Add your custom plugins below.
  Plug 'whatyouhide/vim-gotham'
call plug#end()

" (4) Configure the theme you want to use below.
colorscheme Gotham
let g:lightline.colorscheme = 'gotham'
set background=dark
let g:neoterm_shell = 'fish'

" (5) Enjoy using branglina.vim. Issues and pull requests are welcome!
