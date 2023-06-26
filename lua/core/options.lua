local opt = vim.opt
local g = vim.g

-- reset mapleader
g.mapleader = " "

opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
--opt.copyindent = true
opt.colorcolumn = "120"
opt.cursorline = true
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.formatoptions:append("t")
opt.history = 100
opt.ignorecase = true
opt.infercase = true
opt.laststatus = 3
opt.linebreak = true
opt.mouse = "a"
opt.number = true
--opt.preserveindent = true
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 2
opt.showmode = false
opt.showtabline = 2
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 80
opt.timeout = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.virtualedit = "block"
opt.wrap = true
opt.writebackup = false

g.icons_enabled = true
g.loaded_netrwPlugin = 1
