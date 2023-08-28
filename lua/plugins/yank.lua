return {
	{
		"gbprod/yanky.nvim",
		event = "BufWinEnter",
		config = function()
			require("yanky").setup({
				preserve_cursor_position = {
					enabled = true,
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 500,
				},
				system_clipboard = {
					sync_with_ring = false,
				},
			})
			mhmap("n", "p", "<Plug>(YankyPutAfter)")
			mhmap("x", "p", "<Plug>(YankyPutAfter)")
			mhmap("n", "P", "<Plug>(YankyPutBefore)")
			mhmap("x", "P", "<Plug>(YankyPutBefore)")
			mhmap("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Paste and move cursor after" })
			mhmap("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Paste and move cursor after" })
			mhmap("n", "y", "<Plug>(YankyYank)")
			mhmap("x", "y", "<Plug>(YankyYank)")
			mhmap("n", "<leader>p", '"+gp', { desc = "Paste from clipboard" })
			mhmap("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
			mhmap("v", "<leader>p", '"+gp', { desc = "Paste from clipboard" })
			mhmap("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
		end,
	},
	{
		"gbprod/cutlass.nvim",
		event = "BufWinEnter",
		opts = {
			cut_key = "m",
			exclude = { "ns", "nS" },
		},
	},
}
