local M = {}

function M.init()
    local lsp_status = require('lsp-status')

    lsp_status.register_progress()
end

return M
