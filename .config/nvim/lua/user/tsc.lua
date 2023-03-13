vim.api.nvim_create_user_command("TSC", function()
	local cmd = "tsc --noEmit"
	local output = vim.fn.systemlist(cmd)

	local qflist = {}
	for _, line in ipairs(output) do
		local filename, lineno, colno, message = line:match("^(.+)%((%d+),(%d+)%)%s*:%s*(.+)$")
		if filename ~= nil then
			table.insert(qflist, {
				filename = filename,
				lnum = tonumber(lineno),
				col = tonumber(colno),
				text = message,
				type = "E",
			})
		end
	end
	vim.fn.setqflist({}, "r", { title = "TypeScript Errors", items = qflist })
	if #qflist > 0 then
		vim.cmd("copen")
	end
end, {})
