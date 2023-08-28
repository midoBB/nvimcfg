local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
local view_group = augroup("auto_view", { clear = true })
autocmd("BufWinEnter", {
	desc = "Make q close help, man, quickfix, dap floats",
	group = augroup("q_close_windows", { clear = true }),
	callback = function(event)
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = event.buf })
		if buftype == "nofile" or filetype == "help" then
			vim.keymap.set("n", "q", "<cmd>close<cr>", {
				desc = "Close window",
				buffer = event.buf,
				silent = true,
				nowait = true,
			})
		end
	end,
})

autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
	desc = "Save view with mkview for real files",
	group = view_group,
	callback = function(event)
		if vim.b[event.buf].view_activated then
			vim.cmd.mkview({ mods = { emsg_silent = true } })
		end
	end,
})
autocmd("FileType", {
	desc = "Unlist quickfist buffers",
	group = augroup("unlist_quickfist", { clear = true }),
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})
autocmd("BufWinEnter", {
	desc = "Try to load file view if available and enable view saving for real files",
	group = view_group,
	callback = function(event)
		if not vim.b[event.buf].view_activated then
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
			local buftype = vim.api.nvim_get_option_value("buftype", { buf = event.buf })
			local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
			if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
				vim.b[event.buf].view_activated = true
				vim.cmd.loadview({ mods = { emsg_silent = true } })
			end
		end
	end,
})

vim.api.nvim_create_augroup("bufcheck", {
	clear = true,
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd("FileType", {
	group = "bufcheck",
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})

-- remove extra spaces when saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set shm=filnxtToOF",
})
-- Settings for filetypes:
-- Disable line length marker
vim.api.nvim_create_augroup("setLineLength", {
	clear = true,
})
vim.api.nvim_create_autocmd("Filetype", {
	group = "setLineLength",
	pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
	command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
vim.api.nvim_create_augroup("setIndent", {
	clear = true,
})
vim.api.nvim_create_autocmd("Filetype", {
	group = "setIndent",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_augroup("General", {
	clear = true,
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "General",
	pattern = { "*.{,z,ba}sh", "*.pl", "*.py" },
	desc = "Make files executable",
	callback = function()
		vim.fn.system({ "chmod", "+x", vim.fn.expand("%") })
	end,
})
vim.cmd([[
      augroup gitconfig
        autocmd!
        autocmd FileType gitcommit execute "normal! O" | startinsert
        autocmd FileType NeogitCommitMessage execute "normal! O" | startinsert
      augroup end
    ]])
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "help", "man", "notify", "lspinfo", "spectre_panel", "startuptime" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
		})
	end,
})
