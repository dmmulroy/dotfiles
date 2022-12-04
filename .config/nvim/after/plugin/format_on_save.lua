vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
  pattern = "*",
  desc = 'Run LSP formatting on a file on save',
  command = ":Format",
})
