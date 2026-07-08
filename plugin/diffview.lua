require('diffview').setup({
  file_panel = {
    win_config = {
      width = 25,
    },
  },
})

vim.keymap.set('n', '<leader>go', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>gm', '<cmd>DiffviewOpen origin/main...HEAD<cr>')
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>')
vim.keymap.set('n', '<leader>gt', '<cmd>DiffviewToggleFiles<cr>')
