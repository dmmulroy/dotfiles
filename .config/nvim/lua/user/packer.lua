local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local is_bootstrapped = false

-- If packer hasn't previously been installed, git clone and install it
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  is_bootstrapped = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_install_path)
  vim.cmd.packadd("packer.nvim")
end

-- Set up an autocmd to automatically run PackerCompile on updates to this file
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = vim.api.nvim_create_augroup("recompile_packer", { clear = true}),
  pattern = vim.fn.stdpath("config") .. "/lua/user/packer.lua"

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
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Install treesitter for better syntax highlighting
  use({ 
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", 
  })

  -- Install lualine for a better status line
  use("nvim-lualine/lualine.nvim")

  -- Install gitsigns for git decorations/indicators
  use("lewis6991/gitsigns.nvim")

  -- Install Comment to enable easy/quick (un)commenting
  use("numToStr/Comment.nvim")

  -- Interactive games for learning vim
  use("ThePrimeagen/vim-be-good")
  
  if is_bootstrapped then
    require("packer").sync()
  end
end)



