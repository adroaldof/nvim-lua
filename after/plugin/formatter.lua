local formatter_status, formatter = pcall(require, "formatter")
if not formatter_status then
    print("Please, ensure install of `mhartington/formatter.nvim` plugin")
    return
end

local util = require("formatter.util")

local configurePrettier = function()
    return {
        exe = "prettier",
        args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
        stdin = true,
    }
end

local languageFormatters = {
    lua = {
        require("formatter.filetypes.lua").stylua,
        function()
            if util.get_current_buffer_file_name() == "special.lua" then
                return nil
            end

            return {
                exe = "stylua",
                args = {
                    "--search-parent-directories",
                    "--stdin-filepath",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--",
                    "-",
                },
                stdin = true,
            }
        end,
    },

    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace,
    },
}

local languages = {
    "css",
    "html",
    "java",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "markdown.mdx",
    "scss",
    "svelte",
    "svg",
    "typescript",
    "typescriptreact",
    "xml",
    "yaml",
}

for _, language in ipairs(languages) do
    languageFormatters[language] = { configurePrettier }
end

formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = languageFormatters,
})

vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
    augroup END
]])
