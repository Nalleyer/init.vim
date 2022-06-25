local M = {}

function M.copy_file_path()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('*', path)
    -- print not work
    print("pasted into clipboard")
end

return M
