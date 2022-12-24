vim.g.mapleader = " "

-- DRY - takac/vim-hardtime
--------------------------------------------------------------------------------
vim.g.hardtime_default_on = 1
vim.g.hardtime_showmsg = 1
vim.g.hardtime_maxcount = 2

-- nathanaelkane/vim-indent-guides
--------------------------------------------------------------------------------
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.cmd [[
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212530 ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#253635 ctermbg=4
]]

-- hashivim/vim-terraform
--------------------------------------------------------------------------------
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- Yggdroot/indentLine
--------------------------------------------------------------------------------
vim.g.indentLine_color_term = 239
vim.g.indentLine_char = '▏'
