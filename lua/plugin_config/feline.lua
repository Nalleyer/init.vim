local M = {}

local LEFT_SEP_EMPTY = ' '
local RIGHT_SEP_EMPTY = ' '
local LEFT_SEP_FILL = ' '
local RIGHT_SEP_FILL = ' '

local HL_DEFAULT = {
    fg = '#000000',
    bg = '#FFFFFF',
    --style = 'bold'
}

local HL_DEFAULT_R = {
    fg = '#FFFFFF',
    bg = '#000000',
    --style = 'bold'
}


local STATUS_TABLE = {
    n = "NORMAL",
    no = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND",
    cv = "COMMAND",
    ce = "COMMAND",
    R = "REPLACE",
    Rv = "REPLACE",
    s = "SELECT",
    S = "SELECT",
    [""] = "SELECT",
    t = "TERMINAL",
}

local c = {
    vimode = {
        provider = function()
            return string.format(" %s ", STATUS_TABLE[vim.api.nvim_get_mode()["mode"]])
        end,
        hl = HL_DEFAULT,
        right_sep = { str = RIGHT_SEP_FILL, hl = HL_DEFAULT_R },
    },
    fileinfo = {
        provider = { name = "file_info", opts = { type = "relative" } },
        hl = HL_DEFAULT_R,
        --left_sep = { str = LEFT_SEP_FILL, hl = "FlnAltSep" },
        right_sep = { str = RIGHT_SEP_EMPTY, hl = HL_DEFAULT_R },
    },
    default = { -- needed to pass the parent StatusLine hl group to right hand side
        provider = "",
        hl = "StatusLine",
    },
    cur_position = {
        provider = function()
            -- TODO: What about 4+ diget line numbers?
            return string.format(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
        end,
        hl = HL_DEFAULT_R,
        left_sep = { str = LEFT_SEP_EMPTY, hl = HL_DEFAULT_R },
    },
    cur_percent = {
        provider = function()
            return " " .. require("feline.providers.cursor").line_percentage() .. "  "
        end,
        hl = HL_DEFAULT_R,
        left_sep = { str = LEFT_SEP_EMPTY, hl = HL_DEFAULT_R },
    },
}

-- 需要跑两遍才知道颜色
-- {{c, fg, bg}, ...}
local function add_color(array_of_config_and_color)
    -- TODO
end

local active = {
    { -- left
        c.vimode,
        --c.gitbranch,
        c.fileinfo,
        c.default, -- must be last
    },
    { -- right
        --c.lsp_status,
        --c.lsp_error,
        --c.lsp_warn,
        --c.lsp_info,
        --c.lsp_hint,
        --c.file_type,
        --c.file_enc,
        c.cur_position,
        c.cur_percent,
    },
}

local inactive = {
    { c.in_fileinfo }, -- left
    { c.in_position }, -- right
}

function M.init()
    vim.o.termguicolors = true
    require('feline').setup({
        components = { active = active, inactive = inactive },
        highlight_reset_triggers = {},
        force_inactive = {
            filetypes = {
                "NvimTree",
                "packer",
                "dap-repl",
                "dapui_scopes",
                "dapui_stacks",
                "dapui_watches",
                "dapui_repl",
                "LspTrouble",
                "qf",
                "help",
            },
            buftypes = { "terminal" },
            bufnames = {},
        },
        disable = {
            filetypes = {
                "dashboard",
                "startify",
            },
        },
    })
end

return M
