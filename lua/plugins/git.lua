local git = {
	Add = " ",
	Branch = "",
	Diff = "",
	Git = "",
	Ignore = "",
	Mod = "M",
	Mod_alt = " ",
	Remove = " ",
	Rename = "",
	Repo = "",
	Unmerged = "שׂ",
	Untracked = "ﲉ",
	Unstaged = "",
	Staged = "",
	Conflict = "",
}
return {
	{
		"tanvirtin/vgit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = { { "<leader>ggf", "<cmd>VGit buffer_history_preview<cr>", desc = "File log" } },
	},
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local neogit = require('neogit')
			neogit.setup {}
		end,
		keys = { { "<leader>ggs", "<cmd>Neogit<cr>", desc = "Status" } },
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		lazy = true,
		keys = {
			{ "<leader>ggc", "<cmd>GitConflictListQf<cr>", desc = "Conflict list" },
			{ "<leader>ggt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs" },
			{ "<leader>ggo", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Ours" },
			{ "<leader>ggb", "<cmd>GitConflictChooseBoth<cr>", desc = "Chhose Both" },
			{ "<leader>ggn", "<cmd>GitConflictChooseNone<cr>", desc = "Choose None" },
		},
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = git.Add },
				change = { text = git.Mod_alt },
				delete = { text = git.Remove },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>gn",
					require("gitsigns").next_hunk,
					{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>ph",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "[P]review [H]unk" }
				)
			end,
		},
	},
}
