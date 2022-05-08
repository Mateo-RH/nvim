call plug#begin('~/.config/nvim/plugged')
  Plug 'tomasiser/vim-code-dark'
  Plug 'gruvbox-community/gruvbox'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'

  " Prod
  Plug 'szw/vim-maximizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'

  " Finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " language server
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
call plug#end()

set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set number
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=750
set colorcolumn=88
set scrolloff=5
set background=dark
"set numberwidth=1
"set showcmd
"set wildmenu
"set nowrap
 syntax enable
"set showmatch
"set relativenumber
"set ruler 
set noshowmode
set nohlsearch
filetype plugin indent on
let mapleader = " "
if (has("termguicolors"))
  set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
command! Config execute ":e ~/.config/nvim/init.vim"
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
nnoremap <c-f> :Ttoggle<CR>
inoremap <c-f> <Esc>:Ttoggle<CR>
tnoremap <c-f> <c-\><c-n>:Ttoggle<CR>

" sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>

" junegunn/fzf.vim
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>cc :History:<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
inoremap <expr> <c-x><c-x> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif

" tpope/vim-fugitive
nnoremap <leader>gs :G<cr>
nnoremap <leader>gd :Gdiff master<cr>
nnoremap <leader>gl :G log --oneline --decorate --all --graph<cr>

" neovim/nvim-lspconfig and nvim-lua/completion-nvim
" npm i -g typescript-language-server -s" neovim/nvim-lspconfig and nvim-lua/completion-nvim
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
