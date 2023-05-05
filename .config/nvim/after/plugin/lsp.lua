local null_ls = require("null-ls")
local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds

-- Use neodev to configure lua_ls in nvim directories - must load before lspconfig
require("neodev").setup()

-- Override tsserver diagnostics to filter out specific messages
local messages_to_filter = {
	"This may be converted to an async function.",
	"'_Assertion' is declared but never used.",
	"The signature '(data: string): string' of 'atob' is deprecated.",
	"The signature '(data: string): string' of 'btoa' is deprecated.",
}

local function tsserver_on_publish_diagnostics_override(_, result, ctx, config)
	local filtered_diagnostics = {}

	for _, diagnostic in ipairs(result.diagnostics) do
		local found = false
		for _, message in ipairs(messages_to_filter) do
			if diagnostic.message == message then
				found = true
				break
			end
		end
		if not found then
			table.insert(filtered_diagnostics, diagnostic)
		end
	end

	result.diagnostics = filtered_diagnostics

	vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

-- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers)
local servers = {
	tsserver = {
		settings = {
			experimental = {
				enableProjectDiagnostics = true,
			},
		},
		handlers = {
			["textDocument/publishDiagnostics"] = vim.lsp.with(tsserver_on_publish_diagnostics_override, {}),
		},
	},
	cssls = {},
	graphql = {},
	jsonls = {},
	marksman = {},
	prismals = {},
	sqlls = {},
	tailwindcss = {},
	bashls = {},
	yamlls = {},
	lua_ls = {},
	ocamllsp = {},
}

-- Setup mason so it can manage 3rd party LSP servers
require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- Configure mason to auto install servers
require("mason-lspconfig").setup({
	automatic_installation = { exclude = { "ocamllsp" } },
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(_, buffer_number)
	-- Pass the current buffer to map lsp keybinds
	map_lsp_keybinds(buffer_number)

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
		vim.lsp.buf.format({
			filter = function(client)
				-- Use Prettier to format TS/JS if it's available
				return client.name ~= "tsserver" or not null_ls.is_registered("prettier")
			end,
		})
	end, { desc = "LSP: Format current buffer with LSP" })
end

-- Iterate over our servers and set them up
for name, config in pairs(servers) do
	require("lspconfig")[name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = config.settings,
		handlers = config.handlers,
	})
end

-- Congifure LSP linting/formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	border = "rounded",
	sources = {
		-- formatting
		formatting.prettier,
		formatting.stylua,
		formatting.ocamlformat,

		-- diagnostics
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
			end,
		}),

		-- code actions
		code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
			end,
		}),
	},
})
--
-- Turn on LSP status and progress information
require("fidget").setup({
	text = {
		spinner = "dots_negative",
	},
})

-- Configure borderd for LspInfo ui
require("lspconfig.ui.windows").default_options.border = "rounded"
