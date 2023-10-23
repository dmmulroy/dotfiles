return {
	{
		dir = "~/Code/tsc-prs/pretty-errors/tsc.nvim",
		branch = "pretty-ts-errors",
		ft = { "typescript", "typescriptreact" },
		config = function()
			require("tsc").setup({
				pretty_errors = true,
			})
		end,
	},
}
