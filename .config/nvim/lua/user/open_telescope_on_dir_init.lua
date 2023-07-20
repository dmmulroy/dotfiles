vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("open_telescope_on_dir_init", { clear = true }),
	pattern = "*",
	desc = "Open telescope to search project files if nvim is opened in a directory",
	callback = function()
		local full_path = vim.fn.expand("%:p")
		local is_dir = vim.fn.isdirectory(full_path)
		if is_dir ~= 0 or full_path == "" then
			require("telescope.builtin").find_files({ hidden = true })
		end
	end,
})
