local status, refactoring = pcall(require, "refactoring")
if not status then
	return
end
refactoring.setup({
	prompt_func_return_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
	prompt_func_param_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
})
local status_t, t = pcall(require, "telescope")
if status_t then
	t.load_extension("refactoring")
	vim.api.nvim_set_keymap(
		"v",
		"<leader>re",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Extract Function" }
	)
	vim.api.nvim_set_keymap(
		"v",
		"<leader>rf",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Extract Function To File" }
	)
	vim.api.nvim_set_keymap(
		"v",
		"<leader>rv",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Extract Variable" }
	)
	vim.api.nvim_set_keymap(
		"v",
		"<leader>ri",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Inline Variable" }
	)

	-- Extract block doesn't need visual mode
	vim.api.nvim_set_keymap(
		"n",
		"<leader>rb",
		[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Extract Block" }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>rbf",
		[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Extract Block to File" }
	)

	-- Inline variable can also pick up the identifier currently under the cursor without visual mode
	vim.api.nvim_set_keymap(
		"n",
		"<leader>ri",
		[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
		{ noremap = true, silent = true, expr = false, desc = "Inline Variable" }
	)
	-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
	vim.api.nvim_set_keymap(
		"n",
		"<leader>rv",
		":lua require('refactoring').debug.print_var({ normal = true })<CR>",
		{ noremap = true, desc = "Debug variable" }
	)
	-- Remap in visual mode will print whatever is in the visual selection
	vim.api.nvim_set_keymap(
		"v",
		"<leader>rv",
		":lua require('refactoring').debug.print_var({})<CR>",
		{ noremap = true, desc = "Print variable" }
	)

	-- Cleanup function: this remap should be made in normal mode
	vim.api.nvim_set_keymap(
		"n",
		"<leader>rc",
		":lua require('refactoring').debug.cleanup({})<CR>",
		{ noremap = true, desc = "Debug cleanup" }
	)
end
