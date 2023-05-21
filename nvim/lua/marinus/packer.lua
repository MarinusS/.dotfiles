-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --Fuzzy finder
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })

    use 'mbbill/undotree'

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }


    --Jump to any positions in the visible editor area by entering a 2-character search pattern
    --Initiate the search in the forward (s) or backward (S) direction, or in the other windows (gs).
    --Start typing a 2-character pattern ({c1}{c2}).
    --After typing the first character, you see "labels" appearing next to some of the {c1}{?} pairs. You cannot use the labels yet.
    --Enter {c2}. If the pair was not labeled, then voilà, you're already there. No need to be bothered by remaining labels, just continue editing.
    --Else: select a label. In case of multiple groups, first switch to the desired one, using <space> (step back with <tab>, if needed).tart typing a 2-character pattern ({c1}{c2}).
    --After typing the first character, you see "labels" appearing next to some of the {c1}{?} pairs. You cannot use the labels yet.
    --Enter {c2}. If the pair was not labeled, then voilà, you're already there. No need to be bothered by remaining labels, just continue editing.
    --Else: select a label. In case of multiple groups, first switch to the desired one, using <space> (step back with <tab>, if needed).
    use({
        'ggandor/leap.nvim',
        requires = { { 'tpope/vim-repeat' } }
    })

    --f/F/t/T motions on steroids
    use({
        'ggandor/flit.nvim',
        requires = { {
            'ggandor/leap.nvim',
            requires = { { 'tpope/vim-repeat' } }
        } }
    })

    use 'echasnovski/mini.nvim'

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                              -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    })

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use 'simrat39/rust-tools.nvim'

    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    })

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    --Color scheme
    --Apply color scheme with vim.cmd('colorscheme tokyonight')
    use 'folke/tokyonight.nvim'
end)
