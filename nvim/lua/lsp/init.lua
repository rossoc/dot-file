require('lsp.rust')

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
}
require'lspconfig'.clangd.setup{
	on_attach = on_attach,
}
require'lspconfig'.cmake.setup{
	on_attach = on_attach,
}
require'lspconfig'.gopls.setup{
	on_attach = on_attach,
}
