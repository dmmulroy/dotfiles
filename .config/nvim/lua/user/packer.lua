local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local is_bootstrapped = false

-- If packer hasn"t previously been installed, git clone and install it
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	is_bootstrapped = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_install_path)
	vim.cmd.packadd("packer.nvim")
end

-- Set up an autocmd to automatically run PackerCompile on updates to this file
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = vim.api.nvim_create_augroup("recompile_packer", { clear = true }),
	pattern = vim.fn.stdpath("config") .. "/lua/user/packer.lua",
})

local packer = require("packer")

-- Packer configuration
local conf = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

packer.init(conf)

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Install the catppuccin theme
	use("catppuccin/nvim")

	-- Install treesitter for better syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Additional text objects for treesitter
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- Install nvim-notify for better notifications
	use("rcarriga/nvim-notify")

	-- Install LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Plugin and UI to automatically install LSPs to stdpath
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Install none-ls for diagnostics, code actions, and formatting
			"nvimtools/none-ls.nvim",

			-- Install neodev for better nvim configuration and plugin authoring via lsp configurations
			"folke/neodev.nvim",

			-- Progress/Status update for LSP
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
	})

	-- Install Autocomplete dependencies
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	})

	-- Install telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Install fuzzy finder for telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
	})

	-- Install nvim-lsp-file-operations for file operations via lsp in the file tree
	use({
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
	})

	-- Install neo-tree for a vscode-like file tree/explorer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				tag = "v2.*",
			},
		},
	})

	-- Install lualine for a better status line
	use("nvim-lualine/lualine.nvim")

	-- Install gitsigns for git decorations/indicators
	use("lewis6991/gitsigns.nvim")

	-- Install Comment to enable easy/quick (un)commenting
	use("numToStr/Comment.nvim")

	-- Install indent_blankline to style indentation
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Install nvim-autopairs  and nvim-ts-autotag to auto close brackets & tags
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Install vim-surround for managing parenthese, brackets, quotes, etc
	use("tpope/vim-surround")

	-- Install maximizer as a depedency to easily toggle max/min a split buffer
	use("szw/vim-maximizer")

	-- Install dressing to create better ui/pop ups for vim.ui.input and vim.ui.select elements
	use("stevearc/dressing.nvim")

	-- Install harpoon easy tracking/switching of multiple buffers
	use("ThePrimeagen/harpoon")

	-- Install wilder to improve the wildmenu
	use("gelguy/wilder.nvim")

	-- Install symbol-outine for a sidebar toggle for the current buffers symbols
	use("simrat39/symbols-outline.nvim")

	-- Install context-commentstring to enable jsx commenting is ts/js/tsx/jsx files
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Install vim-illuminate to hightlight other uses of the word under your cursor
	use("RRethy/vim-illuminate")

	-- Install Github Copilot
	-- use("github/copilot.vim")
	use({ "zbirenbaum/copilot.lua" })

	-- Install tsc.nvim to enable project-wide type checking and diagnostics
	-- use({ "dmmulroy/tsc.nvim" })
	use("~/Code/tsc.nvim")

	-- Install vim-kitty-navigator to enable better navigation between neovim and kitty
	-- use("knubie/vim-kitty-navigator")
	use({ "dmmulroy/vim-kitty-navigator" })

	-- Install nvim-spectre for global find/replace
	use({
		"nvim-pack/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	--Install nvim-ufo for better folds
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	if is_bootstrapped then
		require("packer").sync()
	end
end)
