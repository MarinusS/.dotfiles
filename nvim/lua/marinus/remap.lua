--Native vim remaps
--
--Plugin remaps are in the "after" folder where each plugin is configured
vim.g.mapleader = " "
vim.keymap.set('n', "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set('n', "<C-j>", "<C-w>j", { desc = "Go to left window" })
vim.keymap.set('n', "<C-k>", "<C-w>k", { desc = "Go to left window" })
vim.keymap.set('n', "<C-l>", "<C-w>l", { desc = "Go to left window" })

vim.keymap.set("n", "<leader>l", function()
	vim.cmd("set relativenumber!")
end, { desc = "Relative line number toggle" })

vim.keymap.set("i", "<C-c>", "<Esc>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected lines up"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected lines down"})

vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste without saving current selection"})

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc= "Yank to sys clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Yank to end of line to sys clipboard"})
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = "Delete to void"})

--zz centers the view around the cursor, easier to navigate
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Half page jump down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Half page jump down"})
vim.keymap.set("n", "n", "nzzzv", {desc = "Next search match"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous search match"})


--Keymap that used to bring to end of file I believe.
--Kept pressing it by accident
vim.keymap.set("n", "<C-f>", "<nop>")

--If have no clue what this Q does, some kind of macro recording ?.
--Same thing kept pressins by mistake
vim.keymap.set("n", "Q", "<nop>")
