local lsp = require("lsp-zero")

require("lspconfig").cmake.setup({
	on_attach = lsp.on_attach,
})
