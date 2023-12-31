# dotfiles/.config/nvim

<a href="https://dotfyle.com/dmmulroy/dotfiles-config-nvim"><img src="https://dotfyle.com/dmmulroy/dotfiles-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/dmmulroy/dotfiles-config-nvim"><img src="https://dotfyle.com/dmmulroy/dotfiles-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/dmmulroy/dotfiles-config-nvim"><img src="https://dotfyle.com/dmmulroy/dotfiles-config-nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:dmmulroy/dotfiles ~/.config/dmmulroy/dotfiles
NVIM_APPNAME=dmmulroy/dotfiles/.config/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=dmmulroy/dotfiles/.config/nvim nvim
```

## Plugins

### colorscheme

- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### command-line

- [gelguy/wilder.nvim](https://dotfyle.com/plugins/gelguy/wilder.nvim)

### comment

- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### cursorline

- [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### editing-support

- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)

### file-explorer

- [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### lsp

- [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### nvim-dev

- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### programming-languages-support

- [dmmulroy/tsc.nvim](https://dotfyle.com/plugins/dmmulroy/tsc.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### utility

- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)

## Language Servers

- cmake
- eslint
- gleam
- graphql
- html
- ocamllsp
- tsserver

This readme was generated by [Dotfyle](https://dotfyle.com)
