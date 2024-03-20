return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    { "<D-Up>", "<C-w>+" },
    { "<D-Down>", "<C-w>-" },
    { "<D-Left>", "<C-w><" },
    { "<D-Right>", "<C-w>>" },
  },
}

-- local opts = { noremap = true }
-- -------------------------------------------------------------------------------
-- -- Navigate between windows
-- -- CTRL+j, CTRL+k, CTRL+h, or CTRL+l
-- -------------------------------------------------------------------------------
-- -- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- -- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- -- vim.keymap.set("n", "<c-h>", "<c-w>h")
-- -- vim.keymap.set("n", "<c-l>", "<c-w>l")
--
-- vim.keymap.set("n", "<c-j>", ":<C-U>TmuxNavigateDown<cr>", opts)
-- vim.keymap.set("n", "<c-k>", ":<C-U>TmuxNavigateUp<cr>", opts)
-- vim.keymap.set("n", "<c-h>", ":<C-U>TmuxNavigateLeft<cr>", opts)
-- vim.keymap.set("n", "<c-l>", ":<C-U>TmuxNavigateRight<cr>", opts)
--
-- -------------------------------------------------------------------------------
-- -- Resize windows
-- -- CTRL+j, CTRL+k, CTRL+h, or CTRL+l
-- -------------------------------------------------------------------------------
-- vim.keymap.set("n", "<D-Up>", "<C-w>+")
-- vim.keymap.set("n", "<D-Down>", "<C-w>-")
-- vim.keymap.set("n", "<D-Left>", "<C-w><")
-- vim.keymap.set("n", "<D-Right>", "<C-w>>")
