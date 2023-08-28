return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	keys = {
		{ "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
		{ "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find project" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
		{ "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Previous commands" },
		{ "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Available commands" },
		{ "<leader>fH", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Text" },
		{ "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Todos" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", "node_modules" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<esc>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
		require("telescope").load_extension("fzy_native")
	end,
}
