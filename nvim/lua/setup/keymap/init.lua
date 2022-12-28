vim.g.mapleader = " "
require('setup.keymap.fn')

-- harpoon
mark = require('harpoon.mark')
ui = require('harpoon.ui')
vim.keymap.set('n', ";<tab>", function() ui.toggle_quick_menu() end, silent)
vim.keymap.set('n', ";a", function() mark.add_file() end, silent)
vim.keymap.set('n', ";r", function() mark.rm_file() end, silent)
vim.keymap.set('n', ";q", function() ui.nav_file(1) end, silent)
vim.keymap.set('n', ";w", function() ui.nav_file(2) end, silent)
vim.keymap.set('n', ";e", function() ui.nav_file(3) end, silent)
vim.keymap.set('n', ";r", function() ui.nav_file(3) end, silent)

-- telescope
telescope = require('telescope.builtin')
vim.keymap.set('n', "<leader>f", function() telescope.find_files({ no_ignore = false, hidden = true }) end, silent)
vim.keymap.set('n', ";f", function() telescope.live_grep() end, silent)
vim.keymap.set('n', ";g", function() telescope.git_files() end, silent)
vim.keymap.set('n', ";s", ":Telescope buffers<CR>", silent)

-- useful vim remap
vim.keymap.set('n', "<leader>w", ":w<CR>", silent)
vim.keymap.set('n', "<leader>q", ":q!<CR>", silent)
vim.keymap.set('n', "<leader>e", ":Ex<CR>", silent)
vim.keymap.set('n', "<leader>v", ":vsplit<CR><C-w>w", silent)
vim.keymap.set('n', '<C-w>=', '<C-w>>', silent)
vim.keymap.set('n', '<C-w>-', '<C-w><', silent)
vim.keymap.set('n', '<C-d>', '<C-d>zz', silent)
vim.keymap.set('n', '<C-u>', '<C-u>zz', silent)
vim.keymap.set('n', '{', ':keepjumps {<CR>', silent)
vim.keymap.set('n', '}', ':keepjumps }<CR>', silent)

vim.keymap.set('n', 'n', 'nzzzv', silent)
vim.keymap.set('n', 'N', 'Nzzzv', silent)
vim.keymap.set('n', '<leader>y', '"+y', silent)

vim.keymap.set('n', '<leader>F', function()
	vim.lsp.buf.format()
end)

vim.keymap.set('x', '<leader>p', "\"_dP", silent)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", silent)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", silent)
vim.keymap.set('v', '<leader>y', '"+y', silent)

-- makefile
vim.keymap.set('n', "mc", function() compile() end, silent)
vim.keymap.set('n', "mr", function() make('run') end, silent)
vim.keymap.set('n', "mt", function() make('test') end, silent)
vim.keymap.set('n', "mh", ":! make -f /Users/carlorosso/.config/Makefile help<CR>", silent)

vim.keymap.set('n', "<leader>mr", ":! make run<CR>", silent)
vim.keymap.set('n', "<leader>mC", ":! make clean<CR>", silent)


-- cargo
vim.keymap.set('n', ",b", ":! cargo build<CR>", silent)
vim.keymap.set('n', ",r", ":! cargo run<CR>", silent)
vim.keymap.set('n', ",t", ":! cargo test<CR>", silent)

-- TroubleToggle
vim.keymap.set('n', '<space>t', ":TroubleToggle document_diagnostics<CR>" , silent)
vim.keymap.set('n', ';t', ":TroubleToggle wrkspace_diagnostics<CR>", silent)

-- undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle , silent)

-- fugitive
vim.keymap.set('n', '<leader>g', ":Git<CR>", silent)
