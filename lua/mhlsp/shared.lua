local export = {}

local function lsp_keymaps(bufnr)
	local function map(mode, lhs, rhs, desc)
		local options = { noremap = true, silent = true }
		if desc then
			options = vim.tbl_extend("force", options, { desc = desc })
		end
		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
	end
	--[[ map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", "Show incoming calls")
	map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", "Show outgoing calls") ]]
	map("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", "Find symbol")
	map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", "Peek symbol")
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
	map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", "Go to Implementation")
	map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Go to References")
	map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", "Go to type definition")
	map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", "See Line diagnostics")
	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Show Code actions")
	vim.keymap.set("n", "<leader>cr", function()
		return ":IncRename " .. vim.fn.expand("<cword>")
	end, { expr = true, desc = "Rename" })
	map("n", "<leader>=", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", "Format current file")
	map("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>", "Show hover documentation")
	map("i", "<C-p>", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>", "Show signature help")
	map("n", "<C-p>", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>", "Show signature help")
	map("n", "<C-S-q>", "<cmd>Telescope aerial<CR>", "Search document symbols")
	map("n", "<leader>go", "<cmd>Lspsaga outline<CR>", "Show document outline")
	map("n", "(d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Go to next error")
	map("n", ")d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Go to previous error")
end

function export.on_attach(client, bufnr)
	lsp_keymaps(bufnr)
	local status_sign, sign = pcall(require, "lsp_signature")
	local status_navic, navic = pcall(require, "nvim-navic")
	local status_hints, hints = pcall(require, "lsp-inlayhints")
	if status_hints then
		hints.on_attach(client, bufnr, false)
	end
	if status_navic then
		navic.attach(client, bufnr)
	end
	if status_sign then
		sign.on_attach({
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)
	end
	local status_ok, illuminate = pcall(require, "illuminate")
	if status_ok then
		illuminate.on_attach(client)
	end

	--[[ client.server_capabilities.document_formatting = true ]]
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			group = vim.api.nvim_create_augroup("SharedLspFormatting", { clear = true }),
			pattern = "*",
			command = "lua vim.lsp.buf.format({ timeout_ms = 4000 })",
		})
	end
end

local function OpenQF()
	local qf_name = "quickfix"
	local qf_empty = function()
		return vim.tbl_isempty(vim.fn.getqflist())
	end
	if not qf_empty() then
		vim.cmd.copen()
		vim.cmd.wincmd("J")
	else
		print(string.format("%s is empty.", qf_name))
	end
end

local function FindQF(type)
	local wininfo = vim.fn.getwininfo()
	local win_tbl = {}
	for _, win in pairs(wininfo) do
		local found = false
		if type == "l" and win["loclist"] == 1 then
			found = true
		end
		if type == "q" and win["quickfix"] == 1 and win["loclist"] == 0 then
			found = true
		end
		if found then
			table.insert(win_tbl, { winid = win["winid"], bufnr = win["bufnr"] })
		end
	end
	return win_tbl
end

local function OpenLoclistAll()
	local wininfo = vim.fn.getwininfo()
	local qf_name = "loclist"
	local qf_empty = function(winnr)
		return vim.tbl_isempty(vim.fn.getloclist(winnr))
	end
	for _, win in pairs(wininfo) do
		if win["quickfix"] == 0 then
			if not qf_empty(win["winnr"]) then
				vim.api.nvim_set_current_win(win["winid"])
				vim.cmd.lopen()
			else
				print(string.format("%s is empty.", qf_name))
			end
		end
	end
end

function export.ToggleQF(type)
	local windows = FindQF(type)
	if #windows > 0 then
		for _, win in ipairs(windows) do
			vim.api.nvim_win_hide(win.winid)
		end
	else
		if type == "l" then
			OpenLoclistAll()
		else
			OpenQF()
		end
	end
end

return export
