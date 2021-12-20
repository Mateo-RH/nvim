"curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    mkdir $HOME/.config/nvim/plugged
set nocompatible
filetype off
set background=dark
set encoding=UTF-8
set number
set mouse=a
set numberwidth=1
set expandtab
set showcmd
set wildmenu
set shiftwidth=4
set hidden
set nowrap
set incsearch
syntax enable
set showmatch
set scrolloff=5
set relativenumber
set ruler 
set noshowmode
set nohlsearch
set signcolumn=yes
set colorcolumn=86

let g:airline_theme='onedark'
let g:gruvbox_contrast_dark='hard'

call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'

Plug 'github/copilot.vim'

" Typing
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify' "git marks

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline' "status bar
Plug 'nvim-lua/plenary.nvim' " navitation
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/harpoon'

" TS
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end() 

colorscheme gruvbox

" Custom mappings
let mapleader = " " 
command! Config execute ":e ~/.config/nvim/init.vim"
nmap <Leader>w :w<CR>
nmap <Leader>s <Plug>(easymotion-s2)
noremap <leader>/ :Commentary<cr>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>


" Custom behaviour
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Movew lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Yank behave like cut and delete
nnoremap Y y$

" Harpoon
nmap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nmap <Leader>h1 :lua require("harpoon.ui").nav_file(1) <CR>
nmap <Leader>h2 :lua require("harpoon.ui").nav_file(2) <CR>
nmap <Leader>h3 :lua require("harpoon.ui").nav_file(3) <CR>
nmap <Leader>hl :lua require('harpoon.ui').toggle_quick_menu()<CR>
nmap <Leader>hn :lua require("harpoon.ui").nav_next()<CR>
nmap <Leader>hp :lua require("harpoon.ui").nav_prev()<CR>

" Fugitive
nmap <Leader>gf :diffget //2<CR>
nmap <Leader>gj :diffget //3<CR>
nmap <Leader>gs :G<CR>

" NerdTree
let NERDTreeShowHidden=1
nmap <Leader>nt :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction


" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua <<EOF
require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
  }
}
EOF

" Ts Syntax
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    additional_vim_regex_highlighting = false,
  },
}
EOF

