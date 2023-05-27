local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000
}

M.name = "onedark"

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. M.name .. "\n\n" .. fault)
  end
end

return M
