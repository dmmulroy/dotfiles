local function bind(op, outer_opts)
  outer_opts = outer_opts or {noremap = true, silent = true}
  return function (lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local keymapFns = {}

keymapFns.map = bind("")
keymapFns.nmap = bind("n", {noremap = false})
keymapFns.nnoremap = bind("n")
keymapFns.vnoremap = bind("v")
keymapFns.xnoremap = bind("x")
keymapFns.inoremap = bind("i")

return keymapFns
