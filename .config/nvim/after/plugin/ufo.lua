require("ufo").setup({
	provider_selector = function(_bufnr, _filetype, _buftype)
		return { "treesitter", "indent" }
	end,
})
