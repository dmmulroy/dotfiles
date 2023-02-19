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
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		severity = {
			min = vim.diagnostic.severity.INFO,
			max = vim.diagnostic.severity.ERROR,
		},
	},
})

-- Enables LSP file operations in nvim-tree
require("lsp-file-operations").setup()

-- Create an autocmd to automatically open nvim-tree when opening vim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
})
