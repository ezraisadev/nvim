local map = vim.keymap.set

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
