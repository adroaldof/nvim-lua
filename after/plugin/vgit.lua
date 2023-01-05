local vgit_status, vgit = pcall(require, "vgit")
if not vgit_status then
    print("Please, ensure install of `tanvirtin/vgit.nvim` plugin")
    return
end

vgit.setup()
