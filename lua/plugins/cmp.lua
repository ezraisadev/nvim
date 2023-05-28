local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_vscode").lazy_load()
	local select_opts = { behavior = cmp.SelectBehavior.Select }

	local kind_icons = {
		Text = " ",
		Method = " ",
		Function = " ",
		Constructor = " ",
		Field = " ",
		Variable = " ",
		Class = " ",
		Interface = " ",
		Module = " ",
		Property = " ",
		Unit = " ",
		Value = " ",
		Enum = " ",
		Keyword = " ",
		Snippet = " ",
		Color = " ",
		File = " ",
		Reference = " ",
		Folder = " ",
		EnumMember = " ",
		Constant = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	}

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", priority = 1000 },
			{ name = "luasnip", keyword_length = 3 },
			{ name = "nvim_lsp_signature_help" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
		mapping = {
			["<Up>"] = cmp.mapping.select_prev_item(select_opts),
			["<Down>"] = cmp.mapping.select_next_item(select_opts),

			["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
			["<C-n>"] = cmp.mapping.select_next_item(select_opts),

			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),

			["<C-e>"] = cmp.mapping.abort(),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<CR>"] = cmp.mapping.confirm({ select = false }),

			["<C-f>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<Tab>"] = cmp.mapping(function(fallback)
				local col = vim.fn.col(".") - 1

				if cmp.visible() then
					cmp.select_next_item(select_opts)
				elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
					fallback()
				else
					cmp.complete()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item(select_opts)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		formatting = {
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s%s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- Source
				vim_item.menu = ({
					buffer = "󰿗",
					nvim_lsp = "󰒋",
					luasnip = "󰇺",
				})[entry.source.name]
				return vim_item
			end,
		},
		experimental = {
			ghost_text = true,
		},
		enabled = function()
			-- disable completion in comments
			local context = require("cmp.config.context")
			-- keep command mode completion enabled when cursor is in a comment
			if vim.api.nvim_get_mode().mode == "c" then
				return true
			else
				return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
			end
		end,
	})
end

return M
