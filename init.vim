"curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    mkdir $HOME/.config/nvim/plugged

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end() 

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set expandtab
set shiftwidth=4
syntax enable
set showmatch
" set relativenumber
set ruler 

let mapleader=" "

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
