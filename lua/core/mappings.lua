local utils = require("core.utils")
local get_icon = utils.get_icon
local map = vim.keymap.set

-- Set space as leader key
map("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Standard operations
map("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { silent = true, desc = "Quit" })
map("n", "<leader>c", "<cmd>close<cr>", { silent = true, desc = "Close window" })
map("n", "<leader>h", "<cmd>Alpha | wincmd o <cr>", { silent = true, desc = "Home" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Left window navigation" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Down window navigation" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Up window navigation" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Right window navigation" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line dbdown (normal)" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up (normal)" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down (insert)" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up (insert)" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down (visual)" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up (visual)" })

-- Navigate buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Close buffer
map("n", "<leader>bc", "<cmd>bdelete!<cr>", { desc = "Buffer Close" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Nvim-tree
map("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })
map("n", "<leader>fo", "<cmd>NvimTreeFocus<cr>", { desc = "File Explorer focus" })

-- Telescope
--map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find for word under cursor" })
map("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find all files" })
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find git files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
map("n", "<leader>fH", "<cmd>Telescope highlights<cr>", { desc = "Highlight groups" })
map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in buffer" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word in workspace" })

-- Git
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>gf", "<cmd>G<cr>", { desc = "Git fugitive" })

-- ToggleTerm
map("t", "<F7>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
