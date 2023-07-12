local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason.nvim" },
		{
			"nvim-lua/plenary.nvim",
			lazy = true,
		},
	},
}

function M.config()
	local null_ls = require("null-ls")
	local code_actions = null_ls.builtins.code_actions
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				-- Ignore formatting from these LSPs
				local lsp_formatting_denylist = {
					eslint = true,
					lemminx = true,
					lua_ls = true,
				}
				if lsp_formatting_denylist[client.name] then
					return false
				end
				return true
			end,
			bufnr = bufnr,
		})
	end
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
		debug = false,
		sources = {
			formatting.prettierd.with({
				extra_filetypes = { "toml" },
				--extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			}),
			formatting.black.with({ extra_args = { "--fast" } }), -- python
			formatting.stylua,
			code_actions.eslint_d,
			diagnostics.eslint_d,
			diagnostics.flake8, -- python
			-- diagnostics.pylint,
		},
	})
end

return M
