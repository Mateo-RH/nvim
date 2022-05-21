nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <silent>gy <cmd>:Telescope lsp_type_definitions<CR>

lua <<EOF
require('telescope').setup{
  pickers = {
    find_files = { theme = "dropdown" }
  }
}
EOF
