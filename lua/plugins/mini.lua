local M = {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",
}

function M.config()
  -- surround
  require("mini.surround").setup()

  -- autopairs
  require("mini.pairs").setup()

  -- fuzzy find
  require("mini.fuzzy").setup({})

end

return M

