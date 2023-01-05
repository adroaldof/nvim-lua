local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    print("Please, ensure install of `windwp/nvim-autopairs.nvim` plugin")
    return
end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
