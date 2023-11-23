return {
	{
		"dmmulroy/vim-kitty-navigator",
		condition = function()
			return os.getenv("TERM") == "xterm-kitty"
		end,
	},
}
