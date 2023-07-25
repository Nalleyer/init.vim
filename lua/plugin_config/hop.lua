local M = {}

function M.init()
    -- place this in one of your configuration file(s)
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
        hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false})
    end, { remap = true })
    vim.keymap.set('', 'F', function()
        hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set('', 't', function()
        hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false})
    end, { remap = true })
    vim.keymap.set('', 'T', function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false})
    end, { remap = true })
end

return M
