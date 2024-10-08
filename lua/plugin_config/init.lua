require 'plugin_config/lsp_status'.init()
require 'plugin_config/fidget'.init()
require 'plugin_config/nvim_tree'
require 'plugin_config/cmp'
require 'plugin_config/workspaces'
require 'plugin_config/telescope'.init()
require 'plugin_config/treesitter'.init()
--require 'plugin_config/lualine'
--require 'plugin_config/feline'.init()
require 'plugin_config/mini_align'.init()
require 'plugin_config/hop'.init()
require 'plugin_config/heirline'.init()


require'nu'.setup{
    use_lsp_features = false,
}
vim.g.copilot_enabled = false

