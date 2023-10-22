return {
	{
		"dmmulroy/tsc.nvim",
		ft = { "typescript", "typescriptreact" },
		config = function()
			require("tsc").setup()
		end,
	},
}
