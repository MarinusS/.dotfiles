return {
	'mbbill/undotree',
	config= function ()
		vim.api.nvim_set_var('undotree_WindowLayout', '2')
		vim.keymap.set('n', '<leader>u', function ()
			vim.cmd.UndotreeToggle()
			vim.cmd.UndotreeFocus()
		end)
	end
}
