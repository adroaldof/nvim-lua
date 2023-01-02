-------------------------------------------------------------------------------
-- Navigate between windows
-- CTRL+j, CTRL+k, CTRL+h, or CTRL+l
-------------------------------------------------------------------------------
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-------------------------------------------------------------------------------
-- Resize windows
-- CTRL+j, CTRL+k, CTRL+h, or CTRL+l
-------------------------------------------------------------------------------
vim.keymap.set("n", "<D-Up>", "<C-w>+")
vim.keymap.set("n", "<D-Down>", "<C-w>-")
vim.keymap.set("n", "<D-Left>", "<C-w><")
vim.keymap.set("n", "<D-Right>", "<C-w>>")
