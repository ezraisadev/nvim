-- Close the tab/nvim when Nvim-tree is the last window.
-- vim.api.nvim_create_autocmd("QuitPre", {
-- 	callback = function()
-- 		local invalid_win = {}
-- 		local wins = vim.api.nvim_list_wins()
-- 		for _, w in ipairs(wins) do
-- 			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
-- 			if bufname:match("NvimTree_") ~= nil then
-- 				table.insert(invalid_win, w)
-- 			end
-- 		end
-- 		if #invalid_win == #wins - 1 then
-- 			-- Should quit, so we close all invalid windows.
-- 			for _, w in ipairs(invalid_win) do
-- 				vim.api.nvim_win_close(w, true)
-- 			end
-- 		end
-- 	end,
-- })

---@author kikito
---@see https://codereview.stackexchange.com/questions/268130/get-list-of-buffers-from-current-neovim-instance
local function get_listed_buffers()
	local buffers = {}
	local len = 0
	for buffer = 1, vim.fn.bufnr("$") do
		if vim.fn.buflisted(buffer) == 1 then
			len = len + 1
			buffers[len] = buffer
		end
	end

	return buffers
end

vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BufDelete",
	group = "alpha_on_empty",
	callback = function(event)
		local found_non_empty_buffer = false
		local buffers = get_listed_buffers()

		for _, bufnr in ipairs(buffers) do
			if not found_non_empty_buffer then
				local name = vim.api.nvim_buf_get_name(bufnr)
				local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

				if bufnr ~= event.buf and name ~= "" and ft ~= "Alpha" then
					found_non_empty_buffer = true
				end
			end
		end

		if not found_non_empty_buffer then
			require("nvim-tree").close()
			vim.cmd([[:Alpha]])
		end
	end,
})
