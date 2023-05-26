local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("nvim-tree").setup({
    --Automatically focus already-opened file by Enter (<CR>)
    on_attach = function(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      local ok, api = pcall(require, "nvim-tree.api")
      assert(ok, "api module is not found")
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Tab drop"))
    end,
    renderer = {
      add_trailing = true,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })
end

return M
