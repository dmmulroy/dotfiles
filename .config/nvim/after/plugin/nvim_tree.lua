-- Disable netrw to prevent race conditions w/ nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- See *nvim-tree-default-mappings* for default kep binds
require("nvim-tree").setup({
	hijack_unnamed_buffer_when_opening = true,
	update_focused_file = {
		enable = true,
	},
	actions = {
		expand_all = {
			exclude = { "node_modules", ".git", ".vscode", ".github", "dist", "build", "_opam" },
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
		local buffer_name = vim.api.nvim_buf_get_name(0)
		local is_commit_or_merge_msg = string.match(buffer_name, "COMMIT_EDITMSG")
			or string.match(buffer_name, "MERGE_MSG")
		local is_file_buffer = vim.fn.expand("%:p") ~= ""

		if not is_commit_or_merge_msg and not vim.g.is_kitty_scrollback then
			require("nvim-tree.api").tree.open()
			if is_file_buffer then
				-- Focus on the file buffer
				vim.cmd.wincmd("p")
			end
		end
	end,
})
