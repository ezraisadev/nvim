local M = {
  "akinsho/bufferline.nvim", 
  event = "VeryLazy",
  version = "*", 
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("bufferline").setup({
    options = {
      close_command = "bdelete! %d",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight =  "Directory",
          text_align = "center",
          padding = 0.9,
          separator = false,
        },
      },
      separator_style = "thin",
    },
  })
end

return M
