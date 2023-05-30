local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<F7>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal Horizontal" },
	},
}
function M.config()
	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	require("toggleterm").setup({
		direction = "horizontal",
		size = 15,
		hide_numbers = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		close_on_exit = true,
	})
end

return M
