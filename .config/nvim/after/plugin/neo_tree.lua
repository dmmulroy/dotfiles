local function _open_node(state, node)
	if node.type == "directory" then
		if not node:is_expanded() then
			require("neo-tree.sources.filesystem").toggle_directory(state, node)
		elseif node:has_children() then
			require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
		end
	end
end

local function open_node(state)
	local node = state.tree:get_node()
	_open_node(state, node)
end

local function close_node(state)
	local node = state.tree:get_node()
	if node.type == "directory" and node:is_expanded() then
		require("neo-tree.sources.filesystem").toggle_directory(state, node)
	else
		require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
	end
end

local function open_or_focus_preview(state)
	local Preview = require("neo-tree.sources.common.preview")
	if Preview.is_active() then
		Preview.focus()
	else
		Preview.toggle(state)
	end
end

local function traverse_and_apply(state, node, fn)
	fn(state, node)

	if node:has_children() then
		for _, child in ipairs(state.tree:get_nodes(node:get_id())) do
			traverse_and_apply(state, child, fn)
		end
	end
end

local function recursively_open_nodes(state)
	local node = state.tree:get_node()
	traverse_and_apply(state, node, _open_node)
end

-- Enable window picker for neo-tree to select which window to load the file in
-- with the 'w' keybinding
require("window-picker").setup({
	hint = "floating-big-letter",
	filter_rules = {
		bo = {
			-- ignore these filetypes
			filetype = { "neo-tree", "neo-tree-popup", "notify" },
			-- ignore these buftypes
			buftype = { "terminal", "quickfix" },
		},
	},
})

require("neo-tree").setup({
	commands = {
		open_or_focus_preview = open_or_focus_preview,
		open_node = open_node,
		close_node = close_node,
		recursively_open_nodes = recursively_open_nodes,
	},
	default_component_configs = {
		diagnostics = {
			symbols = {
				error = "󰅚",
				warn = "󰀪",
				info = "󰋽",
				hint = "󰌶",
			},
		},
		icon = {
			folder_empty = "",
			folder_empt_open = "",
		},
	},
	event_handlers = {},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_pattern = {
				"**/.vscode",
				"**/node_modules",
				"**/dist",
				"**/build",
				"**/_build",
				"**/_opam",
				"**/.git",
				"**/.DS_Store",
			},
		},
		follow_current_file = {
			enabled = true,
		},
		window = {
			mappings = {
				["<bs>"] = "close_node",
				["!"] = "navigate_up",
			},
		},
	},
	open_files_do_not_replace_types = { "terminal", "qf", "fidget", "Outline", "qf", "notify" },
	popup_border_style = "rounded",
	source_selector = {
		winbar = true,
	},
	window = {
		mappings = {
			["h"] = "close_node",
			["l"] = "open_node",
			["L"] = "recursively_open_nodes",
			["z"] = "close_all_subnodes",
			["Z"] = "close_all_nodes",
			["P"] = { "open_or_focus_preview", config = { use_float = true } },
		},
		width = 35,
	},
})

-- Setup LSP file operations to enable lsp rename in neo-tree
require("lsp-file-operations").setup()

-- TODO: Add event handler for file_renamed
-- PR opened to nvim-lsp-file-operations: https://github.com/antosha417/nvim-lsp-file-operations/pull/14
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1050
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/593
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/308#issuecomment-1304765940
-- See: https://github.com/antosha417/nvim-lsp-file-operations/blob/master/lua/lsp-file-operations/will-rename.lua
