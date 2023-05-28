local M = {
	"neovim/nvim-lspconfig",
	lazy = true,
}
function M.config()
	local servers = {
		tsserver = {},
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local on_attach = function(_, bufnr)
		local map = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end
		map("gd", vim.lsp.buf.definition, "Goto definition")
		map("gD", vim.lsp.buf.declaration, "Goto declaration")
		map("gr", vim.lsp.buf.references, "Goto references")
		map("gI", vim.lsp.buf.implementation, "Goto implementation")
		map("gT", vim.lsp.buf.type_definition, "Type definition")
		map("K", vim.lsp.buf.hover, "Hover documentation")
		map("<leader>lR", require("telescope.builtin").lsp_references, "Search references")
		map("<leader>la", vim.lsp.buf.code_action, "Code action")
		map("<leader>ld", vim.diagnostic.open_float, "Hover diagnostics")
		map("<leader>lf", vim.lsp.buf.format, "Format buffer")
		map("<leader>lh", vim.lsp.buf.signature_help, "Signature help")
		map("<leader>li", "<cmd>LspInfo<cr>", "LSP information")
		map("<leader>lr", vim.lsp.buf.rename, "Rename current symbol")
		map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Search document symbols")
		map("<leader>lw", require("telescope.builtin").lsp_workspace_symbols, "Search workspace symbols")
		map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
		map("]d", vim.diagnostic.goto_next, "Next diagnostic")

		-- Create a command `:Format` local to the LSP buffer
		vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
			vim.lsp.buf.format()
		end, { desc = "Format current buffer with LSP" })
	end

	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
			})
		end,
	})

	-- Diagnostics
	local get_icon = require("core.utils").get_icon
	local sign = function(opts)
		vim.fn.sign_define(opts.name, {
			texthl = opts.name,
			text = opts.text,
			numhl = "",
		})
	end
	local config = {
		virtual_text = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
		},
	}

	sign({ name = "DiagnosticSignError", text = get_icon("DiagnosticError"), texthl = "DiagnosticSignError" })
	sign({ name = "DiagnosticSignWarn", text = get_icon("DiagnosticWarn"), texthl = "DiagnosticSignWarn" })
	sign({ name = "DiagnosticSignHint", text = get_icon("DiagnosticHint"), texthl = "DiagnosticSignHint" })
	sign({ name = "DiagnosticSignInfo", text = get_icon("DiagnosticInfo"), texthl = "DiagnosticSignInfo" })

	vim.diagnostic.config(config)

	-- Show line diagnostics automatically in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})

	-- Help windows with borders
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

return M
