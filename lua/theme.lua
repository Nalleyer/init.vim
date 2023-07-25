vim.opt.background = 'dark'
local is_gui_running = vim.api.nvim_eval("has('gui_running')")
--print(is_gui_running)
if is_gui_running == 0 then
    vim.cmd('colorscheme catppuccin-mocha')
    return
end
-- preview at https://base16.netlify.app/
local THEMES = {
    { 'gruvbox' },
    { 'base16-classic-light' },
    --{ 'base16-atelier-lakeside-light' },
    { 'ayu',
        function()
            local ayu = require('ayu')
            ayu.setup({
                mirage = true,
            })
        end
    },
    { 'catppuccin ' },
}
local theme_index_this_time = math.random(#THEMES)
local theme_this_time = THEMES[theme_index_this_time]
vim.cmd('colorscheme ' .. theme_this_time[1])
if theme_this_time[2] then
    theme_this_time[2]()
end
