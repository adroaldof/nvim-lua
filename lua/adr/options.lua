-- Options
-- this can be found at `:help options`

-------------------------------------------------------------------------------
-- File Context
-------------------------------------------------------------------------------
vim.opt.number = true -- Line numbers are good
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.relativenumber = true -- Set relative numbers to vim
vim.opt.colorcolumn = "80,120" -- Show column for max line length
vim.opt.signcolumn = "yes" -- Show sign column
vim.opt.scrolloff = 4 -- Min number lines of context
vim.opt.fileencoding = "utf-8" -- The encoding written to a file
vim.opt.autoindent = true
vim.opt.smartindent = true

-------------------------------------------------------------------------------
-- Turn off swap files
-------------------------------------------------------------------------------
vim.opt.swapfile = false -- Disable swap file
vim.opt.backup = false -- Disable backup file
vim.opt.wb = false -- Disable write buffer
vim.opt.writebackup = false -- Disable write backup file
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"

-------------------------------------------------------------------------------
-- Split Windows
-------------------------------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.splitright = true -- Split window to the right
vim.opt.splitbelow = true -- Split window to the below

-------------------------------------------------------------------------------
-- Cursor
-------------------------------------------------------------------------------
vim.opt.cursorline = true -- Enable cursor line

-------------------------------------------------------------------------------
-- Visual
-------------------------------------------------------------------------------
vim.opt.cmdheight = 2 -- Enable cursor line
vim.opt.conceallevel = 0 -- enable quotes on markdown
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.updatetime = 80 -- faster completion (4000ms default)
vim.opt.conceallevel = 0 -- disable the "conceal" syntax to .md and .json files

-------------------------------------------------------------------------------
-- Highlight
--------------------------------------------------------------------------------
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.incsearch = true -- highlight search when typing

vim.opt.completeopt = { "menu", "menuone", "noselect" }
