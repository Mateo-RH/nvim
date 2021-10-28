"curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    mkdir $HOME/.config/nvim/plugged
set nocompatible
filetype off
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Typing
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify' "git marks
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline' "status bar

call plug#end() 

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

set number
set mouse=a
set numberwidth=1
set expandtab
set showcmd
set wildmenu
set shiftwidth=4
syntax enable
set showmatch
set scrolloff=5
set relativenumber
set ruler 
set noshowmode

let mapleader=" "

nmap <Leader>w :w<CR> <Plug>(coc-format)
nmap <Leader>q :q<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>s <Plug>(easymotion-s2)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]
