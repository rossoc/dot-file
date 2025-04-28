vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- Here is where you configure the autocompletion settings.
local lsp_zero = require("lsp-zero")
local lsp = require('lspconfig')
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

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "gopls", "ruff", "rust_analyzer", "ts_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			lsp.lua_ls.setup(lsp_zero.nvim_lua_ls())
		end,

        },
})

require("lsp.rust")
require("lsp.tex")
require("lsp.haskell")

lsp.intelephense.setup({
	on_attach = lsp_zero.on_attach,
})

lsp.ast_grep.setup({
	on_attach = lsp_zero.on_attach,
})

lsp.tinymist.setup{
    settings = {
        formatterMode = "typstyle",
        exportPdf = "never",
        semanticTokens = "disable"
    }
}

lsp.jdtls.setup{
     settings = {
         java_home = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
     }
 }

lsp.clangd.setup({})

lsp.gopls.setup({})

lsp.cmake.setup({})

lsp.ts_ls.setup({})

-- Using pyright for Hover (`C-k`)
lsp.pyright.setup {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}

lsp.ruff.setup({})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

lsp.harper_ls.setup({
    settings = {
        ["harper-ls"] = {
          userDictPath = "~/.config/dict.txt",
        }
    },
    filetypes = { "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua", "markdown", "nix", "python", "ruby", "rust", "swift", "toml", "typescript", "typescriptreact", "haskell", "cmake", "typst", "php", "dart" }
})
