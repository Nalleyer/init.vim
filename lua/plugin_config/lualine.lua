local function workspace()
    local w = require('workspaces')
    local workspace_name = w.name()
    if workspace_name then
        return workspace_name
    else
        return "no workspace"
    end
end

local utils = require('utils')
local function my_progress()
    local cur = vim.fn.line('.')
    local total = vim.fn.line('$')
    local p = utils.make_progress(cur / total)
    return p
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { workspace, 'filename', my_progress, 'lsp_progress' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
