vim.cmd [[packadd packer.nvim]]

local utils = require('utils')

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
    use { "ellisonleao/gruvbox.nvim" }
    use "Shatur/neovim-ayu"
    use "RRethy/nvim-base16"
    use { "catppuccin/nvim", as = "catppuccin" }

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
    -- tabnine
    --use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}

    -- file telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    use 'nvim-treesitter/nvim-treesitter'

    use 'natecraddock/workspaces.nvim'

    use 'Raku/vim-raku'
    use 'leafo/moonscript-vim'
    use 'nvim-lua/lsp-status.nvim'
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
    }
    use({
        "rebelot/heirline.nvim",
        -- You can optionally lazy-load heirline on UiEnter
        -- to make sure all required plugins and colorschemes are loaded before setup
        -- event = "UiEnter",
        --config = function()
        --    require("heirline").setup({...})
        --end
    })

    use 'Vonr/align.nvim'

    if not utils.is_big_file() then
        use 'github/copilot.vim'
    else
        print("big file, not loading copilot")
    end
    use 'HiPhish/nvim-ts-rainbow2'

    use {
        'aznhe21/hop.nvim',
        branch = 'fix-some-bugs', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup {}
        end
    }

    use 'LhKipp/nvim-nu'
end)
