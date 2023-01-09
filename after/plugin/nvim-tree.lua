-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        number = true,
        relativenumber = true,
        adaptive_size = true,
        signcolumn = "yes",
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        highlight_opened_files = "all",
        group_empty = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = "signcolumn",
            glyphs = {
                git = {
                    unstaged = "פֿ",
                },
            },
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
        enable = true,
    },
})
