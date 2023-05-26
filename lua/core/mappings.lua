local utils = require "core.utils" 
local get_icon = utils.get_icon
local map = vim.keymap.set

local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  p = { desc = get_icon("Package", 1, true) .. "Packages" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  u = { desc = get_icon("Window", 1, true) .. "UI" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  S = { desc = get_icon("Session", 1, true) .. "Session" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}

map("", "<leader>f", "<cmd>lua print('find files')<cr>", sections.f)

-- set space as leader key
map("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- exit insert mode
map("i", "jk", "<ESC>", { silent = true, desc = "exit insert mode" })

-- write (save) file
map("n", "<leader>w", "<cmd>w<cr>", { desc = "write (save) file" })

-- confirm quit
map ("n", "<leader>q", "<cmd>confirm q<cr>", { silent = true, desc = "confirm quit" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "left window navigation" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "down window navigation" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "up window navigation" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "right window navigation" })

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "move up" })

-- navigate buffers
map("n", "<S-h>", ":bprevious<CR>",  { desc = "prev buffer" })
map("n", "<S-l>", ":bnext<CR>",  { desc = "next buffer" })


-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape and clear hlsearch" })
