vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- Here is where you configure the autocompletion settings.
local lsp_zero = require("lsp-zero")
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-h>"] = cmp.mapping.complete(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	}),
})

-- This is where all the LSP shenanigans will live
local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "gopls", "pyright", "rust_analyzer", "ts_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			-- (Optional) Configure lua language server for neovim
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

require("lsp.cpp")
require("lsp.go")
require("lsp.make")
require("lsp.python")
require("lsp.rust")
require("lsp.typescript")
require("lsp.tex")
require("lsp.md")
require("lsp.haskell")

require('lsp-zero')
require('lspconfig').intelephense.setup({
	on_attach = lsp_zero.on_attach,
})

require('lspconfig').ast_grep.setup({
	on_attach = lsp_zero.on_attach,
})

require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "never" -- Choose onType, onSave or never.
        -- serverPath = "" - Normally, there is no need to uncomment it.
	},
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
}

 require'lspconfig'.jdtls.setup{
     settings = {
         java_home = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
     }
 }
