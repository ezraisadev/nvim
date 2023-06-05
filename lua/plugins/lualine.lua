local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
}

function M.config()
	local get_icon = require("core.utils").get_icon
	local lualine = require("lualine")
	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = "",
			section_separators = "",
			disabled_filetypes = {
				statusline = { "dashboard", "alpha" },
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = { modified = get_icon("FileModified"), readonly = get_icon("FileReadOnly"), unnamed = "" },
				},
			},
			lualine_x = { "diff", "diagnostics" },
			lualine_y = {
				{ "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
				"progress",
			},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return M
-- },
