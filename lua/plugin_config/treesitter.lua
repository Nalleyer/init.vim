local M = {}
function M.init()
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    -- nvim-treesitter config
    require 'nvim-treesitter.configs'.setup {
        -- ensure_installed = "maintained", -- for installing all maintained parsers
        ensure_installed = { "rust", "lua", "python", "proto", "c_sharp" }, -- for installing specific parsers
        sync_install = true, -- install synchronously
        ignore_install = {}, -- parsers to not install
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- disable standard vim highlighting
        },
    }
end

return M
