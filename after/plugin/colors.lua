function CustomizeColorScheme(colorScheme)
	local color = colorScheme or "onedark"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Theme configurations
-----------------------------------------------------------------------------
local onedark_status, onedark = pcall(require, "onedark")
if not onedark_status then
	print("Install `navarasu/onedark.nvim` plugin at your plugin managment")
	return
end

onedark.setup({
	style = "deep",
	transparent = true,
})

onedark.load()

-- Status line configurations
-----------------------------------------------------------------------------
local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
	print("Install `nvim-lualine/lualine.nvim` plugin at your plugin managment")
	return
end

local status_bar_theme = require("lualine.themes.nightfly")

local status_bar_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

status_bar_theme.normal.a.bg = status_bar_colors.blue
status_bar_theme.insert.a.bg = status_bar_colors.green
status_bar_theme.visual.a.bg = status_bar_colors.violet
status_bar_theme.command = {
	a = {
		gui = "bold",
		bg = status_bar_colors.yellow,
		fg = status_bar_colors.black,
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		icons_enabled = true,
		theme = status_bar_theme,
	},
})

CustomizeColorScheme()
