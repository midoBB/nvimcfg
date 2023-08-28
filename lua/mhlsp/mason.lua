local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local status_ok_2, mason_null = pcall(require, "mason-null-ls")
if not status_ok_2 then
	return
end

local servers = {
	"jsonls",
	"gopls",
	"jsonls",
	"yamlls",
}

local null_ls = {
	"black",
	"flake8",
	"sql_formatter",
	"stylua",
	"jq",
	"prettierd",
	"nixfmt",
	"eslint_d",
	"tidy",
	"shellcheck",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

mason_null.setup({
	ensure_installed = null_ls,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {
	on_attach = require("mhlsp.shared").on_attach,
	capabilities = require("mhlsp.handlers").capabilities,
}
local function fix_imports()
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({ opts })
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["lua_ls"] = function()
		local new_opts = require("mhlsp.lua")
		lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", opts, new_opts))
	end,
	["tsserver"] = function()
		local new_opts = require("mhlsp.jsts")
		local status, typescript = pcall(require, "typescript")
		if status then
			typescript.setup({
				disable_commands = false,
				debug = false,
				setup = vim.tbl_deep_extend("force", opts, new_opts),
			})
		end
		lspconfig.tsserver.setup(vim.tbl_deep_extend("force", opts, new_opts))
	end,
	["gopls"] = function()
		lspconfig.gopls.setup({
			on_attach = function(client, bufnr)
				require("mhlsp.shared").on_attach(client, bufnr)
				require("lsp-inlayhints").setup({
					inlay_hints = { type_hints = { prefix = "=> " } },
				})
				require("lsp-inlayhints").on_attach(client, bufnr)
				vim.api.nvim_create_autocmd({ "BufWritePost" }, {
					group = vim.api.nvim_create_augroup("FixGoImports", { clear = true }),
					pattern = "*.go",
					callback = function()
						fix_imports()
					end,
				})
			end,
			settings = {
				gopls = {
					analyses = {
						assign = true,
						atomic = true,
						bools = true,
						composites = true,
						copylocks = true,
						deepequalerrors = true,
						embed = true,
						erroras = true,
						fieldalignment = true,
						httpresponse = true,
						ifaceassert = true,
						loopclosure = true,
						nilfunc = true,
						nilness = true,
						nonewvars = true,
						printf = true,
						shadow = true,
						shift = true,
						unusedparams = true,
						unusedvariable = true,
						unusedwrite = true,
						useany = true,
					},
					experimentalPostfixCompletions = true,
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})
	end,
	["jdtls"] = function()
		print("JDTLS handles its own lsp")
	end,
	["yamlls"] = function()
		local new_opts = require("mhlsp.yaml")
		lspconfig.yamlls.setup(vim.tbl_deep_extend("force", opts, new_opts))
	end,
	["jsonls"] = function()
		local new_opts = require("mhlsp.json")
		lspconfig.jsonls.setup(vim.tbl_deep_extend("force", opts, new_opts))
	end,
})
