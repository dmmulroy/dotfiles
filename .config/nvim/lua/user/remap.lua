local nnoremap = require("user.keymap").nnoremap
local inoremap = require("user.keymap").inoremap
local vnoremap = require("user.keymap").vnoremap
local map = require("user.keymap").map

-- Normal --
-- Window navigation
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-h>", "<C-w>h")

-- Buffer navigation
nnoremap("<A-l>", "<cmd>bnext<cr>")
nnoremap("<A-h>", "<cmd>bprevious<cr>")

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", {silent = false})

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", {silent = false})

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", {silent = false})

-- Map netrw to <leader>e
nnoremap("<leader>e", "<cmd>Lex 20<cr>")

-- Center buffer while navigating with <C-u> and <C-d> or when hopping through search results
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")

-- Press 'S' for quick find/replace
nnoremap("S", ":%s//g<left><left>", {silent = false})

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("<S-L>", "$")
nnoremap("<S-H>", "^")

-- Insert --
-- Map jj to <esc>
inoremap("jj", "<esc>")

-- Visual --
-- Move selected text up/down in visual mode (TODO: Figure out how to enable this for multi line) 
-- vnoremap("<A-k>", "<cmd>m '<-2<CR>gv=gv") 
-- vnoremap("<A-j>", "<cmd>m '>+1<CR>gv=gv")
