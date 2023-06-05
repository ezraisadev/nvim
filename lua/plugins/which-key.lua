local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local get_icon = require("core.utils").get_icon
	local wk = require("which-key")
	wk.setup({
		icons = {
			group = "",
		},
		plugins = {
			marks = false, -- shows a list of your marks on ' and `
			registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true,
				suggestions = 20,
			}, -- use which-key for spelling hints
			presets = {
				operators = false, -- adds help for operators like d, y, ...
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = false, -- bindings for folds, spelling and others prefixed with z
				g = false, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = "Comments" },
		popup_mappings = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "none", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
			padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "j", "k" },
			v = { "j", "k" },
		},
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by default for Telescope
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	local names = {
		f = get_icon("Search", 1, true) .. "Find",
		p = get_icon("Package", 1, true) .. "Packages",
		l = get_icon("ActiveLSP", 1, true) .. "LSP",
		u = get_icon("Window", 1, true) .. "UI",
		b = get_icon("Tab", 1, true) .. "Buffers",
		bc = get_icon("TabClose", 1, true) .. "Buffer Close",
		bs = get_icon("Sort", 1, true) .. "Sort Buffers",
		d = get_icon("Debugger", 1, true) .. "Debugger",
		g = get_icon("Git", 1, true) .. "Git",
		S = get_icon("Session", 1, true) .. "Session",
		t = get_icon("Terminal", 1, true) .. "Terminal",
	}

	wk.register({
		b = { name = names.b, c = names.bc },
		f = { name = names.f },
		g = { name = names.g, h = "Hunk (gitsigns)" },
		h = { name = get_icon("Home", 1, true) .. "Home" },
		l = { name = names.l },
		q = { name = get_icon("Quit", 1, true) .. "Quit" },
		w = { name = get_icon("Save", 1, true) .. "Save" },
	}, { prefix = "<leader>" })
end

return M
