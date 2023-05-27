local M = {
  "akinsho/bufferline.nvim", 
  event = "VeryLazy",
  version = "*", 
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("bufferline").setup()
end

return M
