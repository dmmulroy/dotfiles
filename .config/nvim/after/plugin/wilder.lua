local wilder = require("wilder")

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlighter = wilder.basic_highlighter(),
		pumblend = 17,
		min_width = "100%",
		min_height = "25%",
		max_height = "25%",
		left = { " ", wilder.popupmenu_devicons() },
		border = "rounded",
	}))
)
