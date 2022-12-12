-- Disable netrw to prevent race conditions w/ nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- * nvim - tree.actions.expand_all.exclude *
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	actions = {
		expand_all = {
			exclude = { "node_modules", ".git", ".vscode", ".github", "dist", "build" },
		},
	},
}) -- See *nvim-tree-default-mappings* for default kep binds
