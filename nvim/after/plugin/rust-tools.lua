local rt = require("rust-tools")
local wk = require("which-key")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
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
				['K']    = { rt.hover_actions.hover_actions, "LSP hover" },
				['<leader>a'] = { rt.code_action_group.code_action_group, "LSP code action" },
			}, opts)
		end,

        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
	},
})
