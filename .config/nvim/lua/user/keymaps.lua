local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local xnoremap = require("user.keymap_utils").xnoremap
local nmap = require("user.keymap_utils").nmap

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Window navigation
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-h>", "<C-w>h")

-- Buffer navigation
nnoremap("<A-l>", "<cmd>bnext<cr>")
nnoremap("<A-h>", "<cmd>bprevious<cr>")

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Map netrw to <leader>e
nnoremap("<leader>e", "<cmd>Rex<cr>")

-- Center buffer while navigating
nnoremap("<c-u>", "<c-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")

-- Press 'S' for quick find/replace
nnoremap("S", ":%s//g<left><left>", { silent = false })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("<S-L>", "$")
nnoremap("<S-H>", "^")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- Diagnostics
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
nmap('<leader>d', vim.diagnostic.open_float)
nmap('<leader>dq', vim.diagnostic.setloclist)

-- Insert --
-- Map jj to <esc>
inoremap("jj", "<esc>")
-- TODO: Test use Caps Lock as <esc>

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode (TODO: this does not work well, find another solution)
-- vnoremap("<A-j>", "<cmd>m '>+1<cr>gv=gv")
-- vnoremap("<A-k>", "<cmd>m '<-2<cr>gv=gv")
