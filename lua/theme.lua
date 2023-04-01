vim.opt.background = 'dark'
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
if vim.env.term and vim.env.term ~= "" then
    vim.cmd('colorscheme gruvbox')
    return
end
local theme_index_this_time = math.random(#THEMES)
local theme_this_time = THEMES[theme_index_this_time]
vim.cmd('colorscheme ' .. theme_this_time[1])
if theme_this_time[2] then
    theme_this_time[2]()
end
