require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = { 
		"sumneko_lua", 
		"rust_analyzer", 
		"pyright", 
		"cmake",
		"clangd",
		"gopls",
	}
})

local on_attach = function (_,_)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust_analyzer"] = {}
    }
})

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
