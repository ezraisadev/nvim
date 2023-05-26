local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local get_icon = require("core.utils").get_icon
  local wk = require "which-key"
  wk.setup{
    icons = {
      group = "",
    },
  }

  local names = {
    f =  get_icon("Search", 1, true) .. "Find",
    p =  get_icon("Package", 1, true) .. "Packages",
    l =  get_icon("ActiveLSP", 1, true) .. "LSP",
    u =  get_icon("Window", 1, true) .. "UI",
    b =  get_icon("Tab", 1, true) .. "Buffers",
    bs = get_icon("Sort", 1, true) .. "Sort Buffers",
    d =  get_icon("Debugger", 1, true) .. "Debugger",
    g =  get_icon("Git", 1, true) .. "Git",
    S =  get_icon("Session", 1, true) .. "Session",
    t =  get_icon("Terminal", 1, true) .. "Terminal",
  }
  
  wk.register({
    f = { name = names.f },
    q = { name = get_icon("Quit", 1, true) .. "Quit" },
    w = { name = get_icon("Save", 1, true) .. "Save" },
  }, { prefix = "<leader>" })
end

return M
