local nnoremap = require("user.keymap").nnoremap
local inoremap = require("user.keymap").inoremap
local vnoremap = require("user.keymap").vnoremap
local xnoremap = require("user.keymap").xnoremap
local map = require("user.keymap").map
local nmap = require("user.keymap").nmap

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

-- Map netrw to <leader>e
nnoremap("<leader>e", "<cmd>Lex 20<cr>")

-- Map netrw to <leader>e
nnoremap("<leader>r", "<cmd>Rex<cr>")

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
nnoremap("S", ":%s//g<left><left>", {silent = false})

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
-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode (TODO: this does not work well, find another solution) 
-- vnoremap("<A-j>", "<cmd>m '>+1<cr>gv=gv")
-- vnoremap("<A-k>", "<cmd>m '<-2<cr>gv=gv") 



-- nmap('<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
-- nmap('<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction' })
--
-- nmap('gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition' })
-- nmap('gi', vim.lsp.buf.implementation, { desc = 'LSP: [G]oto [I]mplementation' })
-- nmap('gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences' })
-- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [D]ocument [S]ymbols' })
-- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'LSP: [W]orkspace [S]ymbols' })
--
-- -- See `:help K` for why this keymap
-- nmap('K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation' })
-- nmap('<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' })
--
-- -- Lesser used LSP functionality
-- nmap('gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' })
-- nmap('<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP: Type [D]efinition' })
-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'LSP: [W]orkspace [A]dd Folder' })
-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'LSP: [W]orkspace [R]emove Folder' })
