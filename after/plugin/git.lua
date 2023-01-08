local git_status, git = pcall(require, "gitsigns")
if not git_status then
    print("Please, ensure install of `lewis6991/gitsigns.nvim` plugin")
    return
end

git.setup()
