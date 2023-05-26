local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000
}

M.name = "kanagawa"

function M.config()
  require("kanagawa").setup({
    compile = true,
    colors = {
      theme = {
        wave = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors)
      return {
        LineNr = {fg = colors.palette.crystalBlue, bg = "none"},
        LineNrAbove = {fg = colors.palette.sumiInk6, bg = "none"},
        LineNrBelow = {fg = colors.palette.sumiInk6, bg = "none"},
      }
    end,
  })
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. M.name .. "\n\n" .. fault)
  end
end

return M
