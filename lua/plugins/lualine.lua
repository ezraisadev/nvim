local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
}

function M.config()
  local lualine = require "lualine"
  lualine.setup()
end

return M
