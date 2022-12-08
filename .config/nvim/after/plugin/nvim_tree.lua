-- Disable netrw to prevent race conditions w/ nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({}) -- See *nvim-tree-default-mappings* for default kep binds
