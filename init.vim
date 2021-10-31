"curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    mkdir $HOME/.config/nvim/plugged
set nocompatible
filetype off
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

" Typing
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify' "git marks
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline' "status bar
Plug 'nvim-lua/plenary.nvim' " navitation
Plug 'nvim-telescope/telescope.nvim'

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
set hidden
syntax enable
set showmatch
set scrolloff=5
set relativenumber
set ruler 
set noshowmode

let mapleader=" "

command! Reload execute "source ~/.config/nvim/init.vim"
command! Config execute ":e ~/.config/nvim/init.vim"

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
