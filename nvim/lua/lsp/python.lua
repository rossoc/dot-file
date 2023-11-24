local lsp = require("lsp-zero")

require("lspconfig").pyright.setup({
	on_attach = lsp.on_attach,
})
