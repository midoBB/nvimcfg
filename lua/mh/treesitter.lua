local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_conf, configs = pcall(require, "nvim-treesitter.configs")
if not status_conf then
	return
end

configs.setup({
	ensure_installed = "all",
	ignore_install = { "comment" },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	context_commentstring = {
		enable = true,
		-- With Comment.nvim, we don't need to run this on the autocmd.
		-- Only run it in pre-hook
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "comment" },
	},
})
local status_args, hlargs = pcall(require, "hlargs")
if status_args then
	hlargs.setup()
end
