let g:neoformat_try_node_exe = 1
nnoremap <leader>F :Neoformat<CR>

" Python formatting with Ruff
" Ruff automatically reads pyproject.toml, ruff.toml, or .ruff.toml
let g:neoformat_python_ruff = {
    \ 'exe': 'ruff',
    \ 'args': ['format', '--stdin-filename', '"%:p"'],
    \ 'stdin': 1,
    \ }

" Also use ruff check --fix for linting fixes
let g:neoformat_python_ruffcheck = {
    \ 'exe': 'ruff',
    \ 'args': ['check', '--fix', '--stdin-filename', '"%:p"'],
    \ 'stdin': 1,
    \ }

" Enable ruff formatters for Python (format first, then fix lint issues)
let g:neoformat_enabled_python = ['ruff', 'ruffcheck']

" Terraform formatting with terraform fmt
let g:neoformat_terraform_terraformfmt = {
    \ 'exe': 'terraform',
    \ 'args': ['fmt', '-'],
    \ 'stdin': 1,
    \ }
let g:neoformat_enabled_terraform = ['terraformfmt']
