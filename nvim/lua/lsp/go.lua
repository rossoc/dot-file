local lsp = require("lsp-zero")

require("lspconfig").gopls.setup({
	on_attach = lsp.on_attach,
})
