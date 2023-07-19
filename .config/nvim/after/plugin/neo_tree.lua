local function open_and_enter_node(state)
	local node = state.tree:get_node()
	if node.type == "directory" then
		if not node:is_expanded() then
			require("neo-tree.sources.filesystem").toggle_directory(state, node)
		elseif node:has_children() then
			require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
		end
	end
end

local function close_and_enter_parent_node(state)
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

require("neo-tree").setup({
	commands = {
		open_or_focus_preview = open_or_focus_preview,
		open_and_enter_node = open_and_enter_node,
		close_and_enter_parent_node = close_and_enter_parent_node,
	},
	default_component_configs = {},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
			hide_by_pattern = {
				"**/.vscode",
				"**/.git",
				"**/.DS_Store",
			},
		},
		follow_current_file = {
			enabled = true,
		},
		window = {
			mappings = {
				["<bs>"] = "close_and_enter_parent_node",
			},
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				if not vim.g.neo_tree_init_in_dir then
					return
				end

				local current_buffer = vim.api.nvim_get_current_buf()
				local all_buffers = vim.api.nvim_list_bufs()

				for _, buffer_id in ipairs(all_buffers) do
					if buffer_id ~= current_buffer then
						vim.api.nvim_buf_delete(buffer_id, { force = true })
					end
				end
				vim.g.neo_tree_init_in_dir = false
			end,
		},
	},
	window = {
		mappings = {
			["h"] = "close_and_enter_parent_node",
			["l"] = "open_and_enter_node",
			["P"] = { "open_or_focus_preview", config = { use_float = true } },
		},
		width = 35,
	},
})

-- Create an autocmd to automatically open nvim-tree when opening vim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local buffer_name = vim.api.nvim_buf_get_name(0)
		local is_commit_or_merge_msg = string.match(buffer_name, "COMMIT_EDITMSG")
			or string.match(buffer_name, "MERGE_MSG")
		local is_file_buffer = vim.fn.expand("%:p") ~= ""

		if not is_file_buffer and not is_commit_or_merge_msg and not vim.g.is_kitty_scrollback then
			vim.g.neo_tree_init_in_dir = true
			require("neo-tree.command").execute({ action = "focus" })
		end
	end,
})

-- TODO: Add event handler for file_renamed
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1050
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/593
-- See: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/308#issuecomment-1304765940
-- See: https://github.com/antosha417/nvim-lsp-file-operations/blob/master/lua/lsp-file-operations/will-rename.lua
