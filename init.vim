filetype plugin indent on
call plug#begin('~/.config/nvim/plugged')
 "Colorshceme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'
  Plug 'sainnhe/gruvbox-material'
  Plug 'joshdick/onedark.vim'

  " Prod
  Plug 'szw/vim-maximizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'

  " Typing
  Plug 'tpope/vim-surround'
  Plug 'Yggdroot/indentLine'
  Plug 'github/copilot.vim'
  Plug 'windwp/nvim-autopairs'
  Plug 'sbdchd/neoformat'

  " Three
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'

  " Finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tpope/vim-fugitive'

  " language server
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'pantharshit00/vim-prisma'

  " Vim inspector
  Plug 'puremourning/vimspector'
call plug#end()

let mapleader = " "
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

command! Config execute ":e ~/.config/nvim/init.vim"
command! Rconfig execute ":so ~/.config/nvim/init.vim"
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nnoremap <leader>X :only<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
xnoremap <Leader>p :\"_dP<CR>
map <Leader>gp :!git pull --rebase && git push<CR>
noremap <leader>/ :Commentary<cr>
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Yank behave like cut and delete
nnoremap Y y$
" Clean all buffers
command! BufOnly silent! execute "%bd|e#|bd#"

" Command to create file in the opened file's directory
command -nargs=1 NewFile edit %:h/<args>

