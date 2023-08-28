local status_yanky, yanky = pcall(require, "yanky")
if status_yanky then
	yanky.setup({
		preserve_cursor_position = {
			enabled = true,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 500,
		},
		system_clipboard = {
			sync_with_ring = false,
		},
	})
end
local status_cutlass, cutlass = pcall(require, "cutlass")
if status_cutlass then
	cutlass.setup({
		cut_key = "m",
		exclude = { "ns", "nS" },
	})
end
local status_splitjoin, splitjoin = pcall(require, "splitjoin")
if status_splitjoin then
	splitjoin.setup({})
end
