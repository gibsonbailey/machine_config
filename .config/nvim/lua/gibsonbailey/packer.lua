-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Packer is for plugin management
return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colors
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Syntax highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':tsupdate' })

    -- LSP support
    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },             -- required
            -- Mason is used to manage installed LSPs
            { 'williamboman/mason.nvim' },           -- optional
            { 'williamboman/mason-lspconfig.nvim' }, -- optional

            -- autocompletion
            { 'hrsh7th/nvim-cmp' },         -- required
            { 'hrsh7th/cmp-nvim-lsp' },     -- required
            { 'hrsh7th/cmp-buffer' },       -- optional
            { 'hrsh7th/cmp-path' },         -- optional
            { 'saadparwaiz1/cmp_luasnip' }, -- optional
            { 'hrsh7th/cmp-nvim-lua' },     -- optional

            -- snippets
            { 'l3mon4d3/luasnip' },             -- required
            { 'rafamadriz/friendly-snippets' }, -- optional
        }
    }

    -- Fast movements using 's<char><char>' and 'S<char><char>'
    use {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end,
    }

    -- Quick line commenting with `gcc` and block commenting with `V (highlight block) gc`
    use 'tpope/vim-commentary'

    -- File Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    -- Buffer "tabs" to see which buffers are open
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Copilot autocompletion
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "copilot",
    --     event = "insertenter",
    --     config = function()
    --         require("copilot").setup({
    --             panel = {
    --                 enabled = false
    --             },
    --             suggestion = {
    --                 enabled = false
    --             },
    --         })
    --     end,
    -- }

    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- }
end)
