function CustomizeColorScheme(colorScheme)
	local color = colorScheme or "rose-pine"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Theme configurations
-----------------------------------------------------------------------------
local theme = require('onedark')

theme.setup {
  style = 'deep',
  transparent = true,
}
theme.load()

-- Status line configurations
-----------------------------------------------------------------------------
require'lualine'.setup {
  options = {
    icons_enabled = true,
  },
}

CustomizeColorScheme("onedark")
