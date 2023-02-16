local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup({
    'tsserver',
    'eslint',
    'dockerls',
    'html',
    'marksman',
    'jedi_laguage_server',
    'pyre',
    'sourcery',
    'pylsp',
    'ruff_lsp',
})
