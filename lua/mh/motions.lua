local status_ok, tabout = pcall(require, "tabout")
if status_ok then
	tabout.setup({
		tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
		backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
		act_as_tab = true, -- shift content if tab out is not possible
		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
		default_shift_tab = "<C-d>", -- reverse shift default action,
		enable_backwards = true, -- well ...
		completion = true, -- if the tabkey is used in a completion pum
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
			{ open = "<", close = ">" },
		},
		ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
		exclude = {}, -- tabout will ignore these filetypes
	})
end

local status_leap, leap = pcall(require, "leap")
if status_leap then
	leap.add_default_mappings()
end

local status_flit, flit = pcall(require, "flit")
if status_flit then
	flit.setup({
		keys = { f = "f", F = "F", t = "t", T = "T" },
		labeled_modes = "v",
		multiline = false,
		opts = {},
	})
end
