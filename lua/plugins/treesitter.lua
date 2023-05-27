local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "luap",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml"
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  })

end

return M
