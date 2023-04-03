require("setup.themes")
require("setup.plugins")
require("setup.keymap")
require("plenary")
require("harpoon")
require("notebook")

require("trouble").setup({
	icons = false,
	fold_open = "v", -- icon used for open folds
	fold_closed = ">", -- icon used for closed folds
	indent_lines = false, -- add an indent guide below the fold icons
	signs = {
		-- icons / text used for a diagnostic
		error = "error",
		warning = "warn",
		hint = "hint",
		information = "info",
	},
	use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})

local augroup = vim.api.nvim_create_augroup
local carlo_autogroup = augroup("FormatAutogroup", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
	group = carlo_autogroup,
	pattern = "*",
	command = "FormatWrite",
})
