local lsp = require("lsp-zero")

require("lspconfig").ts_ls.setup({
	on_attach = lsp.on_attach,
})
