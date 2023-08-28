local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end
nvimtree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	hijack_cursor = true,
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	renderer = {
		indent_markers = { enable = true },
	},
})
