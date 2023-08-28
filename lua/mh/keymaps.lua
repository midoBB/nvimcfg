local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = " "
-- set leader key to space

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
map("", "<Space>", "<Nop>")
map("i", "<C-n>", "<Nop>")

--- Disable Recording & Ex Mode
map("", "q", "<nop>")
map("", "Q", "<nop>")

map("n", "U", "<C-R>")
map("", "<C-r>", "<Nop>")

map("n", "x", '"_x')
map("n", "yw", "yiw")
map("n", "dw", '"_diw')
map("n", "cw", '"_ciw')
map("n", "cc", '"_cc')
map("v", "c", '"_c')
map("v", "p", '"_dP')
map("x", "p", '"_dP')
-- Yank ring
map("n", "p", "<Plug>(YankyPutAfter)")
map("x", "p", "<Plug>(YankyPutAfter)")
map("n", "P", "<Plug>(YankyPutBefore)")
map("x", "P", "<Plug>(YankyPutBefore)")
map("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Paste and move cursor after" })
map("x", "gp", "<Plug>(YankyGPutAfter)", { desc = "Paste and move cursor after" })
map("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Paste and move cursor after" })
map("x", "gP", "<Plug>(YankyGPutBefore)", { desc = "Paste and move cursor after" })
map("n", "y", "<Plug>(YankyYank)")
map("x", "y", "<Plug>(YankyYank)")

-- Move around splits using Ctrl + {h,j,k,l}
-- resizing splits
map("n", "<A-h>", "<cmd>lua require('smart-splits').resize_left()<cr>")
map("n", "<A-j>", "<cmd>lua require('smart-splits').resize_down()<cr>")
map("n", "<A-k>", "<cmd>lua require('smart-splits').resize_up()<cr>")
map("n", "<A-l>", "<cmd>lua require('smart-splits').resize_right()<cr>")
-- moving between splits
map("n", "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>")
map("n", "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>")
map("n", "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>")
map("n", "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>")

-- Center the screen when going down a page or up a page
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-o>", "<c-o>zz")
map("n", "<C-i>", "<c-i>zz")

map("n", "j", "gj")
map("n", "k", "gk")
-- map('n', 'J', 'V:m \'>+1<CR>gv=gv<ESC>')
-- map('n', 'K', 'V:m \'<-2<CR>gv=gv<ESC>') --Removed this because it doesn't work with LSP hover
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")
map("n", ">", ">>")
map("n", "<", "<<")
map("x", ">", ">gv")
map("x", "<", "<gv")

-- buffer / window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<S-h>", "<cmd>BufferLineCycleWindowlessPrev<CR>")
map("n", "<S-l>", "<cmd>BufferLineCycleWindowlessNext<CR>")
-- Align
map("x", "aw", "<cmd>lua require('align').align_to_string(false, true, true)<cr>", { desc = "Align to words" })
map("x", "as", "<cmd>lua require('align').align_to_char(1, true, true)<cr>", { desc = "Align to a char" })
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<C-e>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
map("n", "<C-q>", "<cmd>AerialToggle!<CR>", { desc = "View document symbols" })
map("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", { desc = "Search and Replace" })
