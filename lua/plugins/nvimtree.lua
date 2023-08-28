return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>gf", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
		},
		config = function()
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				hijack_cursor = true,
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
			})
		end,
	},
}
