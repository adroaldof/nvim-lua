local is_telescope_ok, builtin = pcall(require, "telescope.builtin")
if not is_telescope_ok then
  print("Please, ensure install of `nvim-telescope/telescope.nvim` plugin")
  return
end

vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep theme=ivy<cr>")

-- TODO: check a way to make a fallback to find_files when git_files give an error
