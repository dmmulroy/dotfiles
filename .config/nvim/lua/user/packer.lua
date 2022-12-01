-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Install the catppuccin theme
  use { "catppuccin/nvim", as = "catppuccin" }
end)
