local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local is_bootstrapped = false

-- If packer hasn't previously been installed, git clone and install it
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  is_bootstrapped = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- Set up an autocmd to automatically run PackerCompile on updates to this file
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = vim.api.nvim_create_augroup("recompile_packer", { clear = true}),
  pattern = vim.fn.stdpath("config") .. "/lua/user/packer.lua"
})

require("packer").startup({function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Install the catppuccin theme
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Install treesitter
  use({ 
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true}))
    end,
  })

  -- Install additional text object for treesitter
  use({ 
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter"
  })

  if is_bootstrapped then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = require("packer.util").float,
    }
  }
})

