local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'dockerls',
    'html',
    'marksman',
    'jedi_laguage_server',
    'pyre',
    'sourcery',
    'pylsp',
    'ruff_lsp',
})
