return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
			"HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
			"haringsrob/nvim_context_vt",
			"windwp/nvim-ts-autotag",
			"m-demare/hlargs.nvim",
			"IndianBoy42/tree-sitter-just",
			{ "windwp/nvim-autopairs", opts = {} },
			{
				"Wansmer/treesj",
				keys = {
					{ "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
				},
				opts = {
					use_default_keymaps = false,
				},
			},
		},
		config = function()
			local rainbow = require("ts-rainbow")
			require("hlargs").setup()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					ensure_installed = {"all"},
  				ignore_install = { "comment" },
					disable = { "comment" },
				},
				rainbow = {
					enable = true,
					query = {
						"rainbow-parens",
					},
					strategy = rainbow.strategy.global,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
			})
		end,
	},
}
