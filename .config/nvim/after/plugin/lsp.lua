local nmap = require("user.keymap_utils").nmap

local on_attach = function(_, buffer_number)
	nmap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nmap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nmap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })
	nmap("gi", vim.lsp.buf.implementation, { desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number })

	-- Telescope LSP keybinds
	nmap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)
	nmap(
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [D]ocument [S]ymbols", buffer = buffer_number }
	)
	nmap(
		"<leader>ws",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [W]orkspace [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nmap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nmap("<leader>D", vim.lsp.buf.type_definition, { desc = "LSP: Type [D]efinition", buffer = buffer_number })

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

-- Setup mason so it can manage 3rd party LSPs
require("mason").setup()

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
	"sumneko_lua",
}

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
-- local diagnostics = null_ls.builtins.diagnostics

-- Install linters and formatters
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"eslint_d",
		"stylua",
	},
})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		-- diagnostics.eslint_d,
	},
})

-- Turn on LSP status and progress information
require("fidget").setup()

-- Manual LSP Server Overrides --
-- Lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you"re using (most likely LuaJIT)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
})
