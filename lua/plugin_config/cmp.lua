local cmp = require 'cmp'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local function on_attach(client, bufnr)
    require('lsp-status').on_attach(client, bufnr)
end

local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    --["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.handlers.on_publish_diagnostics, { border = border }),
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- luasnip
            require('luasnip').lsp_expand(args.body)
            -- vsnip
            -- vim.fn["vsnip#anonymous"](args.body)
            -- snippy
            -- require('snippy').expand_snippet(args.body)
            -- ultisnip
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        --['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        --['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        --['<C-y>'] = cmp.config.disable,
        --['<C-e>'] = cmp.mapping({
        --    i = cmp.mapping.abort(),
        --    c = cmp.mapping.close(),
        --}),
        ---- Accept currently selected item...
        ---- Set `select` to `false` to only confirm explicitly selected items:
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s", "c" }),

        -- tab same as c-j
        --[[
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        -]]

        ['<Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
            elseif has_words_before() and luasnip.expand_or_jumpable() then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true),
                    '', true)
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { 'i', 's', 'c' }
        ),

        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s", "c" }),

        -- ... Your other mappings ...
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, { { name = 'buffer' } })
})

-- You can also set special config for specific filetypes:
--    cmp.setup.filetype('gitcommit', {
--        sources = cmp.config.sources({
--            { name = 'cmp_git' },
--        }, {
--            { name = 'buffer' },
--        })
--    })

-- nvim-cmp for commands
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
require 'lspconfig'.gopls.setup {}
local servers = { 'clangd', 'html', 'tsserver', 'rust_analyzer', 'bashls', 'pyright', 'gopls', 'sumneko_lua', 'racket_langserver' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
for _, lsp_name in ipairs(servers) do
    require('lspconfig')[lsp_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
    }
end

-- special gdscript
require'lspconfig'.gdscript.setup {
    cmd = { "ncat", "localhost", "6008" }
}

local devicons = require('nvim-web-devicons')
cmp.register_source('devicons', {
    complete = function(_, _, callback)
        local items = {}
        for _, icon in pairs(devicons.get_icons()) do
            table.insert(items, {
                label = icon.icon .. '  ' .. icon.name,
                insertText = icon.icon,
                filterText = icon.name,
            })
        end
        callback({ items = items })
    end,
})

local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(_, vim_item)
                return vim_item
            end
        })
    }
}
