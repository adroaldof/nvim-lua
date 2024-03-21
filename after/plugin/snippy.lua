local snippy_status, snippy = pcall(require, "snippy")
if not snippy_status then
  print("Please, ensure install of `dcampos/nvim-snippy` plugin")
  return
end

snippy.setup({})
