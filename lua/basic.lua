vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.opt.number = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true

-- tab
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.listchars = {
    tab = '» ',
    extends = '›',
    precedes = '‹',
    nbsp = '·',
    trail = '·',
}

vim.opt.list = true


-- common typo
vim.cmd('iabbrev adn and')
vim.cmd('iabbrev tehn then')
vim.cmd('iabbrev udpate update')
vim.cmd('iabbrev fasle false')
-- racket lambda
vim.cmd('autocmd BufNewFile,BufRead *.rkt set filetype=racket')
vim.cmd('autocmd FileType racket inoreabbrev lambda λ')

vim.opt.encoding = 'utf-8'
vim.opt.fencs = {
    'utf-8',
    'ucs-bom',
    'gb18030',
    'gbk',
    'gb2312',
    'cp936',
}

vim.opt.helplang = 'cn'

vim.opt.guifont = "Fira Code:h18"
vim.opt.mouse = 'a'

if vim.g.neovide then
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_cursor_animation_length = 0.01
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
    --vim.g.neovide_transparency = 0.9
end

