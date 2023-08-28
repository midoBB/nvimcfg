return {
	{
		"stevearc/resession.nvim",
		config = function()
			local resession = require("resession")
			resession.setup({})
			local function get_session_name()
				local name = vim.fn.getcwd()
				local branch = vim.fn.system("git branch --show-current")
				if vim.v.shell_error == 0 then
					return name .. branch
				else
					return name
				end
			end
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
					vim.api.nvim_create_autocmd("User", {
						pattern = "VeryLazy",
						once = true,
						callback = function()
							if vim.fn.argc(-1) ~= 0 then
								vim.cmd.edit(vim.fn.argv(0))
								vim.cmd.edit(vim.fn.argv(0))
							end
						end,
					})
				end,
			})
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					resession.save(get_session_name(), { dir = "dirsession", notify = false })
				end,
			})
		end,
	},
}
