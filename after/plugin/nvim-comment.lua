local comment_status, comment = pcall(require, "Comment")
if not comment_status then
    print("Please, ensure install of `windwp/nvim-comment.nvim` plugin")
    return
end

comment.setup({
    ignore = "^$",
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
