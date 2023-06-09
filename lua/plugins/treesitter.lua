local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
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
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = false, disable = { "python", "css", "c" } },
		incremental_selection = { enable = true },
		autotag = { enable = true },
	})
end

return M
