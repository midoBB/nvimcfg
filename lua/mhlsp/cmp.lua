local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local status_kind, lspkind = pcall(require, "lspkind")
if not status_kind then
	return
end
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

require("luasnip/loaders/from_vscode").lazy_load()
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				vim_item.menu = ({
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
					nvim_lsp = "[LSP]",
					rg = "[rg]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-k>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping({
			i = function()
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end,
			c = function()
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "rg", keyword_length = 5 },
		{ name = "nvim_lua" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = {
			border = border,
			scrollbar = "┃",
		},
		documentation = {
			border = border,
			scrollbar = "┃",
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
