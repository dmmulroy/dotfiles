local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

require("nvim-autopairs").setup()

-- Integrate nvim-autopairs with cmp
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
