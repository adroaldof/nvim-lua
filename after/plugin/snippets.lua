local friendly_snippets_status, ls = pcall(require, "luasnip")
if not friendly_snippets_status then
  print("Please, ensure install of `L3MON4D3/luasnip.nvim` plugin")
  return
end

local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "Error" } },
      },
    },
  },
})

local s = ls.s
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets(nil, {
  lua = {
    s(
      "req",
      fmt([[local {} = require "{}" ]], {
        f(function(import_name)
          local parts = vim.split(import_name[1][1], ".", true)

          return parts[#parts] or "_"
        end, { 1 }),
        i(1),
      })
    ),
  },

  javascriptreact = {
    s("cl-", fmt("console.log(`** {} **`)", { i(1, "something") })),
    s(
      "cl",
      fmt([[console.log(`** {}`, {})]], {
        i(1, "variable"),
        rep(1),
      })
    ),
    s(
      "cls",
      fmt([[console.log(`** {}`, JSON.stringify(null, 2, {}))]], {
        i(1, "variable"),
        rep(1),
      })
    ),
  },

  typescriptreact = {
    s("cl-", fmt("console.log(`** {} **`)", { i(1, "something") })),
    s(
      "cl",
      fmt([[console.log(`** {}`, {})]], {
        i(1, "variable"),
        rep(1),
      })
    ),
    s(
      "cls",
      fmt([[console.log(`** {}`, JSON.stringify(null, 2, {}))]], {
        i(1, "variable"),
        rep(1),
      })
    ),
  },
})

-- always moves to the next item withing the snippet
vim.keymap.set({ "i", "s" }, "<c-n>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- always moves to the previous item withing the snippet
vim.keymap.set({ "i", "s" }, "<c-p>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- useful for choice nodes
vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- load VSCode snippets
require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" })
