return {
	{
		"tummetott/reticle.nvim",
		opts = {},
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"mrjones2014/smart-splits.nvim",
		version = ">=1.0.0",
		config = function()
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
			-- moving between splits
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
		end,
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
	},
	{
		"folke/zen-mode.nvim",
		dependencies = {

			{
				"folke/twilight.nvim",
				opts = {},
			},
		},
		keys = { {
			"<leader>wc",
			"<cmd>ZenMode<cr>",
			desc = "Enable distraction-free mode",
		} },
		config = function()
			require("zen-mode").setup({
				on_open = function()
					vim.cmd("IndentBlanklineDisable")
				end,
				on_close = function()
					vim.cmd("IndentBlanklineEnable")
				end,
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				signature = {
					enabled = false,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = {
					enabled = false,
				},

				hover = {
					enabled = false,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			messages = {
				enabled = true,
				view = "mini",
				view_error = "mini",
				view_warn = "mini",
				view_history = "messages",
				view_search = "virtualtext",
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
}
