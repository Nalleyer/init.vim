local M = {}

function M.init()
    vim.o.termguicolors = true
    require('feline').setup()
end

return M
