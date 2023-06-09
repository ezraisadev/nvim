local M = {
	"norcalli/nvim-colorizer.lua",
	event = "BufEnter",
}

function M.config()
	require("colorizer").setup({
		DEFAULT_OPTIONS = {
			css = true,
		},
	})
end

return M
