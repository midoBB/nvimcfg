--INFO: This is called diffrently to make sure it doesn't collude with other functions
function mhmap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
return {
	"lewis6991/impatient.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
