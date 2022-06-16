vim.g.mapleader = " "
vim.g.maplocalleader="\\"

local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true})
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', {noremap=true})
end

local function maplua(key, txt)
    vim.api.nvim_set_keymap('n', key, ':lua '..txt..'<cr>', {noremap=true})
end

-- f: file tree
mapcmd('<leader>ft', 'NvimTreeToggle')
mapcmd('<leader>ff', 'NvimTreeFocus')

--open/load vimrc
mapcmd('<leader>ev', ':vsplit $MYVIMRC<cr>')
mapcmd('<leader>sv', ':source $MYVIMRC<cr>')

-- open/load vimrc
mapcmd('<leader>ev', ':vsplit $MYVIMRC<cr>')
mapcmd('<leader>sv', ':source $MYVIMRC<cr>')

-- fase move between windows
mapcmd('<leader>j', '<c-w>j')
mapcmd('<leader>k', '<c-w>k')
mapcmd('<leader>h', '<c-w>h')
mapcmd('<leader>l', '<c-w>l')

-- command
mapcmd('<leader><leader>', ':')
