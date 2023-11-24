local lsp = require("lsp-zero")

require('lspconfig').grammarly.setup {
	on_attach = lsp.on_attach,
	init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', },
}
