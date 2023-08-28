local status_dressing, dressing = pcall(require, "dressing")
if status_dressing then
	dressing.setup({
		input = { relative = "editor" },
		select = { backend = { "telescope", "fzf", "builtin" } },
	})
end
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if status_ok then
	autopairs.setup({})
end

local status_splits, smart_resize = pcall(require, "smart-splits")
if status_splits then
	smart_resize.setup({})
end

local status_project, project = pcall(require, "project_nvim")
if status_project then
	project.setup({})
end

local status_sat, satellite = pcall(require, "satellite")
if status_sat then
	satellite.setup({})
end
local status_twilight, twilight = pcall(require, "twilight")
if status_twilight then
	twilight.setup({})
end
local status_rename, rename = pcall(require, "inc_rename")
if status_rename then
	rename.setup({})
end
local status_fidget, fidget = pcall(require, "fidget")
if status_fidget then
	fidget.setup({})
end
local status_lines, lines = pcall(require, "lsp_lines")
if status_lines then
	lines.setup()
end

local status_outline, outline = pcall(require, "aerial")
if status_outline then
	outline.setup({})
end
local status_neogen, neogen = pcall(require, "neogen")
if status_neogen then
	neogen.setup({})
end
local status_replace, searchreplace = pcall(require, "search-replace")
if status_replace then
	searchreplace.setup({
		default_replace_single_buffer_options = "gcI",
		default_replace_multi_buffer_options = "egcI",
	})
end
local status_zen, zen = pcall(require, "zen-mode")
if status_zen then
	zen.setup()
end

local status_stay, stay = pcall(require, "stay-in-place")
if status_stay then
	stay.setup()
end

local status_cycle, cycle = pcall(require, "bufferline-cycle-windowless")
if status_cycle then
	cycle.setup({
		default_enabled = true,
	})
end

local status_reticle, reticle = pcall(require, "reticle")
if status_reticle then
	reticle.setup({})
end
