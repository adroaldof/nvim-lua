local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  print("Please, ensure install of `nvim-lualine/lualine.nvim` plugin")
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

lualine.setup({
  options = {
    icons_enabled = true,
    theme = status_bar_theme,
  },
  sections = {
    lualine_c = { { "filename", path = 1 } },
  },
})
