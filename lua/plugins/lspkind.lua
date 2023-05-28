local M = {

  "onsails/lspkind.nvim",
  opts = {
    preset = "default",
    mode = "symbol",
    symbol_map = {
      Array = "󰅪",
      Boolean = "⊨",
      Class = "󰌗",
      Constructor = "",
      Key = "󰌆",
      Namespace = "󰅪",
      Null = "NULL",
      Number = "#",
      Object = "󰀚",
      Package = "󰏗",
      Property = "",
      Reference = "",
      Snippet = "",
      String = "󰀬",
      TypeParameter = "󰊄",
      Unit = "",
    },
  },
  --enabled = vim.g.icons_enabled,
  event = "VeryLazy"
}

function M.config(_, opts)
  require("lspkind").init(opts)
end

return M
