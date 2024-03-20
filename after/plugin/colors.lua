-- Theme configurations
-----------------------------------------------------------------------------
local darkplus_status, _ = pcall(require, "kanagawa")
if not darkplus_status then
  print("Please, ensure install of `rebelot/kanagawa.nvim` plugin")
  return
end

function CustomizeColorScheme(colorScheme)
  local color = colorScheme or "kanagawa"

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

CustomizeColorScheme()
