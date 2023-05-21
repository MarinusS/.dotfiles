local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
	["<leader>f"] = { name = "+Find"},
	["<leader>ff"] = {builtin.find_files, "File among project files"},
	["<leader>fg"] = {builtin.git_files, "File among git files"},
	["<leader>fw"] = {builtin.live_grep, "Word"},
	["<leader>fb"] = {builtin.buffers, "Buffer" },
	["<leader>fh"] = {builtin.help_tags, "Help tags" },
})
