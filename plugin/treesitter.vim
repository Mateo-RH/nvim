lua <<EOF
-- nvim-treesitter main branch: highlighting is started per-buffer;
-- pcall skips filetypes without an installed parser
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
EOF
