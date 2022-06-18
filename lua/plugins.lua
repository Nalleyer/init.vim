vim.cmd [[packadd packer.nvim]]


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- packer it self
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    -- themes
    use "RRethy/nvim-base16"

    -- left tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- lsp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'onsails/lspkind-nvim'

    -- file telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    use 'nvim-treesitter/nvim-treesitter'

    use 'natecraddock/workspaces.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'Raku/vim-raku'
    use 'nvim-lua/lsp-status.nvim'
    use 'arkav/lualine-lsp-progress'

    -- Lua
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
