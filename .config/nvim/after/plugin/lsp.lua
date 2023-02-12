local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds

local on_attach = function(_, buffer_number)
	-- Pass the current buffer to map lsp keybinds
	map_lsp_keybinds(buffer_number)

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
		if vim.lsp.buf.format then
			vim.lsp.buf.format({
				filter = function(client)
					return client.name ~= "tsserver"
				end,
			})
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end, { desc = "LSP: Format current buffer with LSP" })
end

-- Use neodev to configure lua_ls in nvim directories - must load before lspconfig
require("neodev").setup()

-- LSPs to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers)
local servers = {
	"tsserver",
	"cssls",
	"graphql",
	"jsonls",
	"marksman",
	"prismals",
	"sqlls",
	"tailwindcss",
	"bashls",
	"yamlls",
	"lua_ls",
}

-- local manually_installed_servers = { "ocamllsp" }

-- Setup mason so it can manage 3rd party LSPs
require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- Install the above servers
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Iterate over our servers and set them up
for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Congifure LSP linting/formatting
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Install linters and formatters
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"eslint_d",
		"stylua",
		-- Don't use mason_null_ls to install ocamlformat and use version managed opam
		-- "ocamlformat",
	},
})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.ocamlformat,
		diagnostics.eslint_d,
	},
})

-- Turn on LSP status and progress information
require("fidget").setup()
