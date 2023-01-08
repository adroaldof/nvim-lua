local git_status, git = pcall(require, "gitsigns")
if not git_status then
    return
end

git.setup({
    signs = {
        delete = { hl = "GitSignsDelete", text = "►", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "◥", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "⫸", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
})
