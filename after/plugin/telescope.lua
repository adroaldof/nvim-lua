local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep theme=ivy<cr>")
