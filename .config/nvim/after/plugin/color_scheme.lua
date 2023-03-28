vim.cmd.colorscheme("catppuccin-macchiato")

local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

update_hl("Comment", { italic = true })
update_hl("Constant", { italic = true })
update_hl("Keyword", { italic = true })
