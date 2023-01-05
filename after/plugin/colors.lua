-- Theme configurations
-----------------------------------------------------------------------------
local darkplus_status, _darkplus = pcall(require, "darkplus")
if not darkplus_status then
    print("Please, ensure install of `navarasu/darkplus.nvim` plugin")
    return
end

function CustomizeColorScheme(colorScheme)
    local color = colorScheme or "darkplus"

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

CustomizeColorScheme()
