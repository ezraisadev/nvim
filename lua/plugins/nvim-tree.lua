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
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    view = {
      width = 30,
      side = "left",
    },
  })
end

return M
