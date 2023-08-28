return {
	{ "echasnovski/mini.ai", version = "*", opts = {} },
	{
		"phaazon/hop.nvim",
		version = "*",
		config = function()
			local hop = require("hop")
			hop.setup({})
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, { remap = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, { remap = true })
			vim.keymap.set("n", "s", function()
				hop.hint_char2()
			end, { remap = true })
			vim.keymap.set("x", "s", function()
				hop.hint_char2()
			end, { remap = true })
			vim.keymap.set("o", "s", function()
				hop.hint_char2()
			end, { remap = true })
		end,
	},
	{ "echasnovski/mini.align", version = "*", opts = {} },
	{
		"johmsalas/text-case.nvim",
		config = function()
			mhmap(
				"n",
				"<leader>xic",
				"<cmd>lua require('textcase').current_word('to_camel_case')<cr>",
				{ desc = "    To lowerCamelCase" }
			)
			mhmap(
				"n",
				"<leader>xiC",
				"<cmd>lua require('textcase').current_word('to_pascal_case')<cr>",
				{ desc = "   To UpperCamelCase" }
			)
			mhmap(
				"n",
				"<leader>xik",
				"<cmd>lua require('textcase').current_word('to_dash_case')<cr>",
				{ desc = "     To kebab-case" }
			)
			mhmap(
				"n",
				"<leader>xiu",
				"<cmd>lua require('textcase').current_word('to_snake_case')<cr>",
				{ desc = "    To under_score" }
			)
			mhmap(
				"n",
				"<leader>xiU",
				"<cmd>lua require('textcase').current_word('to_constant_case')<cr>",
				{ desc = " To UP_CASE" }
			)
		end,
	},
}
