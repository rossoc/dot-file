local lsp = require("lsp-zero")

require("lspconfig").clangd.setup({
	on_attach = lsp.on_attach,
	cmd = { "clangd" },
})
