-- Many of these plugins are configured in the .config/nvim/after/plugins directory.
-- To Sync this file run the following nvim commands:
-- :so %
-- :PackerSync
-- To install formatters, run :Mason and navigate to the formatters section
-- Install the formatters you want to use
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Packer is for plugin management
return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Search
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Colors
    use {"catppuccin/nvim", as = "catppuccin"}

    -- Syntax highlighting
    use {'nvim-treesitter/nvim-treesitter', tag = 'v0.9.1'}

    -- LSP support
    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- lsp support
            {'neovim/nvim-lspconfig'}, -- required
            -- Mason is used to manage installed LSPs
            {'williamboman/mason.nvim'}, -- optional
            {'williamboman/mason-lspconfig.nvim'}, -- optional
            -- autocompletion
            {'hrsh7th/nvim-cmp'}, -- required
            {'hrsh7th/cmp-nvim-lsp'}, -- required
            {'hrsh7th/cmp-buffer'}, -- optional
            {'hrsh7th/cmp-path'}, -- optional
            {'saadparwaiz1/cmp_luasnip'}, -- optional
            {'hrsh7th/cmp-nvim-lua'}, -- optional
            -- snippets
            {'l3mon4d3/luasnip'}, -- required
            {'rafamadriz/friendly-snippets'} -- optional
        }
    }

    -- Quick line commenting with `gcc` and block commenting with `V (highlight block) gc`
    use 'tpope/vim-commentary'

    -- Makes auto-comment cursor position dependent
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- File Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        }
    }

    -- Buffer "tabs" to see which buffers are open
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- Copilot autocompletion
    use "github/copilot.vim"

    -- Formatting
    use 'mhartington/formatter.nvim'
end)
