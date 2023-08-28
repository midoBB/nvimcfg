local status, whichkey = pcall(require, "which-key")
if not status then
	return
end
local conf = {
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
	},
}

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["p"] = { '"+gp', "Paste from clipboard" },
	["y"] = { '"+y', "Copy to clipboard" },
	["w"] = { "<cmd>update!<CR>", "Save" },
	["<leader>q"] = { "<cmd>qa<CR>", "Quit" },
	["q"] = { "<cmd>BufDel<CR>", "Close the current buffer" },
	b = {
		name = "+Buffer",
		c = { "<cmd>BufDelOthers<CR>", "Close the other buffers" },
		f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
	},
	d = {
		name = "+Debugging",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
		I = {
			"<cmd>lua require'dap.ui.widgets'.hover()<cr>",
			"Inspect variable under cursor",
		},
		S = {
			"<cmd>lua local w=require'dap.ui.widgets';w.centered_float(w.scopes)<cr>",
			"Show Scopes",
		},
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start debugging" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate debugging" },
		f = { "<cmd>lua require'dap'.close()<cr>", "Finish debugging" },
		j = { "<cmd>lua require'dap'.down()<cr>", "Go down in call stack" },
		k = { "<cmd>lua require'dap'.up()<cr>", "Go up in call stack" },
	},
	f = {
		name = "+Find",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		g = { "<cmd>Telescope live_grep<cr>", "Find text" },
		p = { "<cmd>Telescope projects<CR>", "Find project" },
		r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
		b = { "<cmd>Telescope buffers<cr>", "Open Buffers" },
		c = { "<cmd>Telescope command_history<cr>", "Previous commands" },
		C = { "<cmd>Telescope commands<cr>", "Available commands" },
		h = { "<cmd>Cheatsheet<cr>", "Help Tags" },
		H = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
		j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		T = { "<cmd>TodoTelescope<cr>", "Todos" },
	},
	s = {
		name = "+Split",
		s = { "<cmd>split<CR>", "Split hortizentally" },
		v = { "<cmd>vsplit<CR>", "Split Vertically" },
		c = { "<cmd>close<CR>", "Close Split" },
	},
	g = {
		name = "+Go to",
		c = { '<cmd>TermExec cmd="git-cz commit"<CR>', "Commit" },
		f = { "<cmd>NvimTreeToggle<cr>", "file system" },
		g = { "<cmd>Neogit<CR>", "Git" },
		y = { "<cmd>YankyRingHistory<cr>", "Clipboard History" },
		i = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace issues" },
		t = { "<cmd>TodoTrouble<cr>", "Todos" },
		u = { "<cmd>UndotreeToggle<cr>", "Undo tree" },
	},
	h = {
		name = "+Git",
		n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
		p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
		P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		b = { "<cmd>Gitsigns blame_line<cr>", "Git blame" },
	},
	m = {
		name = "+Harpoon",
		a = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Add File" },
		m = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Menu" },
	},
	c = {
		name = "+Coding",
		A = {
			name = "Annotate",
			f = { "<cmd>Neogen func<cr>", "Annotate function" },
			c = { "<cmd>Neogen class<cr>", "Annotate class" },
			t = { "<cmd>Neogen type<cr>", "Annotate type" },
			F = { "<cmd>Neogen file<cr>", "Annotate File" },
		},
	},
}

local vopts = {
	mode = "v", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local vmappings = {
	["p"] = { '"+gP', "Paste from clipboard" },
	["y"] = { '"+y', "Copy to clipboard" },
	h = {
		name = "Git Hunks",
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
	},
}
whichkey.setup(conf)
whichkey.register(mappings, opts)
whichkey.register(vmappings, vopts)
