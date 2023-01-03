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
	print("Please, ensure install of `navarasu/onedark.nvim` plugin")
	return
end

onedark.setup({
	style = "deep",
	transparent = true,
})

onedark.load()

CustomizeColorScheme()
