vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':' .. cmd .. '<cr>', { noremap = true })
end

local function maplua(key, txt)
    vim.api.nvim_set_keymap('n', key, ':lua ' .. txt .. '<cr>', { noremap = true })
end

-- f: file tree
mapcmd('<leader>ft', 'NvimTreeToggle')
mapcmd('<leader>ff', 'NvimTreeFocus')

-- open/load vimrc
mapcmd('<leader>ev', ':vsplit $MYVIMRC<cr>')
mapcmd('<leader>sv', ':source $MYVIMRC<cr>')

-- fase move between windows
-- mapcmd('<leader>j', '<c-w>j')
-- mapcmd('<leader>k', '<c-w>k')
-- mapcmd('<leader>h', '<c-w>h')
-- mapcmd('<leader>l', '<c-w>l')

-- command
--mapcmd('<leader><leader>', ':')
-- telescope
mapcmd('<C-p>', '<cmd>lua require"plugin_config/telescope".project_files()<cr>')
mapcmd('<leader>tb', '<cmd>lua require "telescope.builtin".buffers()<cr>')
mapcmd('<leader>tg', '<cmd>lua require "telescope.builtin".live_grep()<cr>')
mapcmd('<leader>tt', '<cmd>lua require "telescope.builtin".diagnostics()<cr>')
mapcmd('<leader>/', '<cmd>lua require"telescope.builtin".grep_string()<cr>')

-- window size
mapkey('n', '<Up>', '<C-w>+')
mapkey('n', '<Down>', '<C-w>-')

-- trouble
--mapcmd('<leader>tt', ':TroubleToggle<cr>')

-- custom
mapcmd('<leader>pp', '<cmd>lua require"child_plugin".copy_file_path()<cr>')

-- lsp
-- rename
mapcmd('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- code action
-- mapcmd('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- go xx
mapcmd('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
mapcmd('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
mapcmd('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
mapcmd('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
mapcmd('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- diagnostic
mapcmd('go', '<cmd>lua vim.diagnostic.open_float({border = "single"})<CR>')
mapcmd('gp', '<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>')
mapcmd('gn', '<cmd>lua vim.diagnostic.goto_next({float = false})<CR>')
-- mapcmd('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
-- leader + =
mapcmd('<leader>==', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- copy paste
mapkey('x', '<F1>', '"+y')
mapkey('n', '<F2>', '"+p')
