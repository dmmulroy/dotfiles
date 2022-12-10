require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"json",
		"tsx",
		"html",
		"css",
		"prisma",
		"markdown",
		"ocaml",
		"yaml",
		"vim",
		"graphql",
		"help",
		"bash",
	},
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
