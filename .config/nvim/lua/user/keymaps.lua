local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local xnoremap = require("user.keymap_utils").xnoremap
local nmap = require("user.keymap_utils").nmap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

local M = {}

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

-- Tab navigation
nnoremap("<leader>to", ":tabnew<CR>") -- open new tab
nnoremap("<leader>tx", ":tabclose<CR>") -- close current tab
nnoremap("<leader>tn", ":tabn<CR>") --  go to next tab
nnoremap("<leader>tp", ":tabp<CR>") --  go to previous tab

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false })

-- Map netrw to <leader>e
nnoremap("<leader>e", "<cmd>NvimTreeFindFileToggle<cr>")

-- Center buffer while navigating
nnoremap("<c-u>", "<c-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")

-- Press 'S' for quick find/replace
nnoremap("S", ":%s//g<left><left>", { silent = false })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("<S-L>", "$")
nnoremap("<S-H>", "^")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- Diagnostics
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<leader>d", vim.diagnostic.open_float)
nmap("<leader>dq", vim.diagnostic.setloclist)

-- Increment/Decrement numbers w/ leader key
nnoremap("<leader>+", "<C-a>")
nnoremap("<leader>-", "<C-x>")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Rezie split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Press leader f to format
nnoremap("<leader>f", ":Format<cr>")

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- Git keymaps --
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")

-- Telescope keybinds
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
nnoremap("<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nnoremap("<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
nnoremap("<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer)
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })
	nnoremap("gi", vim.lsp.buf.implementation, { desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number })

	-- Telescope LSP keybinds
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)
	nnoremap(
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [D]ocument [S]ymbols", buffer = buffer_number }
	)
	nnoremap(
		"<leader>ws",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [W]orkspace [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nnoremap("<leader>D", vim.lsp.buf.type_definition, { desc = "LSP: Type [D]efinition", buffer = buffer_number })
end

-- Insert --
-- Map jj to <esc>
inoremap("jj", "<esc>")

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode (TODO: this does not work well, find another solution)
-- vnoremap("<A-j>", "<cmd>m '>+1<cr>gv=gv")
-- vnoremap("<A-k>", "<cmd>m '<-2<cr>gv=gv")

return M
