-------------------------------------------------------------------------------
-- Vim configuration file and plugin management
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>ve", [[:vsplit ~/.config/nvim/init.lua<cr>]])
vim.keymap.set("n", "<Leader>vs", [[:source ~/.config/nvim/init.lua<cr>]])
vim.keymap.set("n", "<Leader>pi", [[:PackerInstall<cr>]])
vim.keymap.set("n", "<Leader>pu", [[:PackerUpdate<cr>]])
vim.keymap.set("n", "<Leader>ps", [[:PackerSync<cr>]])
vim.keymap.set("n", "<Leader>pc", [[:PackerClean<cr>]])

-------------------------------------------------------------------------------
-- Escape when editing
-------------------------------------------------------------------------------
vim.keymap.set("i", "jj", [[<Esc>]])
vim.keymap.set("i", "jk", [[<Esc>]])
vim.keymap.set("i", "kj", [[<Esc>]])

-------------------------------------------------------------------------------
-- Copy to clipboard
-------------------------------------------------------------------------------
vim.keymap.set("v", "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>Y", [["+yg_]])
vim.keymap.set("n", "<Leader>yy", [["+yy]])

-------------------------------------------------------------------------------
-- Stay in indent mode
-------------------------------------------------------------------------------
vim.keymap.set("v", "<", [[<gv]])
vim.keymap.set("v", ">", [[>gv]])

-------------------------------------------------------------------------------
-- Keep cursor when merging lines
-------------------------------------------------------------------------------
vim.keymap.set("n", "J", "mzJ`z")

-------------------------------------------------------------------------------
-- Better pasting register
-------------------------------------------------------------------------------
vim.keymap.set("v", "p", [["_dP]])

------------------------------------------------------------------------------
-- Move lines in visual mode
------------------------------------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
