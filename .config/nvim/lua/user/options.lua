-- Enable relative line numbers
vim.opt.nu = true 
vim.opt.rnu = true 

-- Set tabs to 2 spaces
vim.opt.tabstop = 2 
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2 

-- Enable incremental searching
vim.opt.incsearch = true 
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false 

-- Set leader key to space
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true 

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Decrease updatetime to 200ms
vim.opt.updatetime = 200

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = 'yes'

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamedplus" 
