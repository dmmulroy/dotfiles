-- Disable netrw to prevent race conditions w/ nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- See *nvim-tree-default-mappings* for default kep binds
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	actions = {
		expand_all = {
			exclude = { "node_modules", ".git", ".vscode", ".github", "dist", "build" },
		},
	},
	git = {
		ignore = false,
	},
})
