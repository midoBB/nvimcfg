return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = false,
	config = function()
		vim.opt.list = true
		vim.opt.listchars:append("eol:↴")
		require("indent_blankline").setup({
			show_current_context = true,
			show_end_of_line = true,
			show_current_context_start = true,
		})
	end,
}
