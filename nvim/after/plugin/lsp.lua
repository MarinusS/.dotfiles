local lsp = require('lsp-zero').preset({})
local wk = require("which-key")

lsp.on_attach(function(client, bufnr)
	local opts = {
		mode = "n", -- NORMAL mode
		-- prefix: use "<leader>f" for example for mapping everything related to finding files
		-- the prefix is prepended to every mapping part of `mappings`
		prefix = "",
		buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
		expr = false, -- use `expr` when creating keymaps
	}

	wk.register({
		['K']    = { '<cmd>lua vim.lsp.buf.hover()<cr>', "LSP hover" },
		['gd']   = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Definition" },
		['gD']   = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Declaration" },
		['gi']   = { '<cmd>lua vim.lsp.buf.implementation()<cr>', "Implementation" },
		['go']   = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type definition" },
		['gr']   = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
		['gs']   = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature help" },
		['<leader>r'] = { '<cmd>lua vim.lsp.buf.rename()<cr>', "LSP rename" },
		['<F3>'] = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "LSP format" },
		['<leader>a'] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', "LSP code action" },
		['gl']   = { '<cmd>lua vim.diagnostic.open_float()<cr>', "Diagnotic open float" },
		['[d']   = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', "Diagnotic go to previous" },
		[']d']   = { '<cmd>lua vim.diagnostic.goto_next()<cr>', "Diagnostic go ti next" },
	}, opts)

	opts = {
		mode = "x", -- VISUAL mode
		-- prefix: use "<leader>f" for example for mapping everything related to finding files
		-- the prefix is prepended to every mapping part of `mappings`
		prefix = "",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
		expr = false, -- use `expr` when creating keymaps
	}
	wk.register({
		['<F3>'] = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "LSP format" },
	}, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.confirm({ select = true })
			else
				cmp.complete()
			end
		end),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
	},
})
