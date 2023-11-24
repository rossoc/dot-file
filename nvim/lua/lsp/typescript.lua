local lsp = require("lsp-zero")

require("lspconfig").tsserver.setup({
	on_attach = lsp.on_attach,
})
