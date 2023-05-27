local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

M.opts = {
  -- char = "▏",
  char = "│",
  filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  show_trailing_blankline_indent = false,
  show_current_context = false,
}

return M
