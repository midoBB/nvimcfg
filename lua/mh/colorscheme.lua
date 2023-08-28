local status_ok, tokyo = pcall(require, "tokyonight")
if status_ok then
	tokyo.setup({
		style = "night",
		hide_inactive_statusline = true,
		dim_inactive = true,
		lualine_bold = true,
		transparent = true,
	})
end
local status_color, _ = pcall(vim.cmd, "colorscheme " .. "oxocarbon")
if not status_color then
	return
end
local status_colorizer, colorizer = pcall(require, "colorizer")
if status_colorizer then
	colorizer.setup()
end
local status_noice, noice = pcall(require, "noice")
if status_noice then
	noice.setup({
		lsp = {
			signature = { enabled = false },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
			lsp_doc_border = false,
		},
	})
end
