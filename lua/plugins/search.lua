return {
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({})
			local kopts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap(
				"n",
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap(
				"n",
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.cmd([[
          aug VMlens
              au!
              au User visual_multi_start lua require('mh.vmlens').start()
              au User visual_multi_exit lua require('mh.vmlens').exit()
          aug END
      ]])
		end,
	},
	{ "mg979/vim-visual-multi" },
	{
		"roobert/search-replace.nvim",
		config = function()
			require("search-replace").setup({
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
			mhmap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", { desc = "Search and Replace" })
		end,
	},
}
