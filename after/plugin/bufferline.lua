local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
	print("Please, ensure install of `akinsho/bufferline.nvim` plugin")
	return
end

bufferline.setup({
	options = {
		numbers = "both",
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostics = "nvim_lsp",
	},
})

local opts = { noremap = true, silent = true }

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
