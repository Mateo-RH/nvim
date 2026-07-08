nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ch <cmd>lua QuickfixHistory()<cr>
nnoremap <silent>gy <cmd>:Telescope lsp_type_definitions<CR>
nnoremap <leader>gl <cmd>lua GitCommitsDiffview()<cr>

lua <<EOF
require('telescope').setup{
  pickers = {
    find_files = { theme = "dropdown" }
  }
}

function QuickfixHistory()
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  require('telescope.builtin').quickfixhistory({
    attach_mappings = function(_, map)
      local select_list = function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd('silent ' .. entry.nr .. 'chistory')
        vim.cmd('cfirst')
      end
      map('i', '<CR>', select_list)
      map('n', '<CR>', select_list)
      return true
    end,
  })
end

function GitCommitsDiffview()
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  require('telescope.builtin').git_commits({
    previewer = false,
    sorting_strategy = 'ascending',
    layout_config = { prompt_position = 'top' },
    attach_mappings = function(_, map)
      local open_diffview = function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd('DiffviewOpen ' .. entry.value .. '^!')
      end
      local copy_hash = function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.fn.setreg('+', entry.value)
        print('Copied commit hash: ' .. entry.value)
      end
      map('i', '<CR>', open_diffview)
      map('n', '<CR>', open_diffview)
      map('i', '<C-y>', copy_hash)
      map('n', '<C-y>', copy_hash)
      return true
    end,
  })
end
EOF
