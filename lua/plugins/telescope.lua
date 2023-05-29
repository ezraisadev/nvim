local M = {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	event = "Bufenter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			enabled = vim.fn.executable("make") == 1,
			build = "make",
		},
	},
}

function M.config()
	local actions = require("telescope.actions")
	local get_icon = require("core.utils").get_icon
	local mappings = {
		i = {
			["<C-n>"] = actions.cycle_history_next,
			["<C-p>"] = actions.cycle_history_prev,
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,
		},
		n = { ["q"] = actions.close },
	}
	require("telescope").setup({
		defaults = {
			prompt_prefix = get_icon("Telescope", 1),
			selection_caret = get_icon("Selected", 1),
			path_display = { "truncate" },
			sorting_strategy = "ascending",
			file_ignore_patterns = { ".git/", "node_modules" },
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			mappings = mappings,
		},
	})
end

return M
