local lsp = require("lsp-zero")

require("lspconfig").rust_analyzer.setup({
	on_attach = lsp.on_attach,
	settings = {
		["rust_analyzer"] = {
			formatting = {
				  dynamicRegistration = true
				},
				hover = {
				  contentFormat = { "markdown", "plaintext" },
				  dynamicRegistration = true
				},
		},
	},
})
