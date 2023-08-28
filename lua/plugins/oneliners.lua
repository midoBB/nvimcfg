return {
	"tpope/vim-sleuth",
	"romainl/vim-cool",
	"airblade/vim-rooter",
	"RRethy/vim-illuminate",
	"tpope/vim-repeat",
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>gu",
				"<cmd>UndotreeToggle<cr>",
				desc = "Undo tree",
			},
		},
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	"NoahTheDuke/vim-just",
}
