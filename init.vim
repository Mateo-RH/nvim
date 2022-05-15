call plug#begin('~/.config/nvim/plugged')
 "Colorshceme
  Plug 'gruvbox-community/gruvbox'
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'

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

  " Three
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'

  " Finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'

  " language server
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'

  " Vim inspector
  Plug 'puremourning/vimspector'
call plug#end()

filetype plugin indent on
syntax enable

set encoding=UTF-8
set relativenumber
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
set wildmenu
set numberwidth=1
set showcmd
set nowrap
set showmatch
set ruler 
set noshowmode
set nohlsearch

if (has("termguicolors"))
  set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

let mapleader = " "
command! Config execute ":e ~/.config/nvim/init.vim"
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
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

let g:airline_theme='onedark'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Harpoon
nmap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nmap <Leader>hl :lua require('harpoon.ui').toggle_quick_menu()<CR>
nmap <Leader>h1 :lua require("harpoon.ui").nav_file(1) <CR>
nmap <Leader>h2 :lua require("harpoon.ui").nav_file(2) <CR>
nmap <Leader>h3 :lua require("harpoon.ui").nav_file(3) <CR>
nmap <Leader>h4 :lua require("harpoon.ui").nav_file(4) <CR>
nmap <Leader>h5 :lua require("harpoon.ui").nav_file(5) <CR>

" NerdTree
let NERDTreeShowHidden=1
nmap <Leader>nt :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 80
let g:neoterm_autoinsert = 1
nnoremap <c-f> :Ttoggle<CR>
inoremap <c-f> <Esc>:Ttoggle<CR>
tnoremap <c-f> <c-\><c-n>:Ttoggle<CR>

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
nnoremap <leader>gd :Gdiff main<cr>
nnoremap <leader>gl :G log --oneline --decorate --all --graph<cr>

" npm i -g typescript-language-server -s" neovim/nvim-lspconfig and nvim-lua/completion-nvim

"Vimspector
fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun
func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
" let g:vimspector_sidebar_width = 120
" let g:vimspector_bottombar_height = 0
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         998,
  \    'vimspectorBPCond':     997,
  \    'vimspectorBPDisabled': 996,
  \    'vimspectorPC':         999,
  \ }

"TreeSitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     custom_captures = {
"       -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
"       ["foo.bar"] = "Identifier",
"     },
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF
