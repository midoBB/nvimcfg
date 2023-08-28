local ArrowClosed = ""
local ArrowOpen = ""
return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				mode = "workspace_diagnostics",
				fold_open = ArrowOpen,
				fold_closed = ArrowClosed,
				auto_jump = { "lsp_definitions" },
				auto_fold = true,
				use_diagnostic_signs = true,
			})
			mhmap("n", "<leader>gi", "<cmd>Trouble workspace_diagnostics<cr>", { desc = "Workspace issues" })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				signs = true,
			})
			mhmap("n", "<leader>gt", "<cmd>TodoTrouble<cr>", { desc = "Todos" })
		end,
	},
}
