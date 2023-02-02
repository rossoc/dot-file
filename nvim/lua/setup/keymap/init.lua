require('setup.keymap.fn')

-- harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
vim.keymap.set('n', ";<tab>", function() ui.toggle_quick_menu() end)
vim.keymap.set('n', ";a", function() mark.add_file() end)
vim.keymap.set('n', ";r", function() mark.rm_file() end)
vim.keymap.set('n', ";q", function() ui.nav_file(1) end)
vim.keymap.set('n', ";w", function() ui.nav_file(2) end)
vim.keymap.set('n', ";e", function() ui.nav_file(3) end)
vim.keymap.set('n', ";r", function() ui.nav_file(3) end)

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', "<leader>f", function() telescope.find_files({ no_ignore = false, hidden = true }) end)
vim.keymap.set('n', ";f", function() telescope.live_grep() end)
vim.keymap.set('n', ";g", function() telescope.git_files() end)
vim.keymap.set('n', ";s", ":Telescope buffers<CR>")

-- useful vim remap
vim.keymap.set('n', "<leader>w", ":lua vim.lsp.buf.format()<CR>:w<CR>")
vim.keymap.set('n', "<leader>q", ":q!<CR>")
vim.keymap.set('n', "<leader>e", ":Ex<CR>")
vim.keymap.set('n', "<leader>v", ":vsplit<CR><C-w>w")
vim.keymap.set('n', '<C-w>=', '<C-w>>')
vim.keymap.set('n', '<C-w>-', '<C-w><')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '{', ':keepjumps {<CR>')
vim.keymap.set('n', '}', ':keepjumps }<CR>')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>y', '"+y')

vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<leader>y', '"+y')

-- makefile
vim.keymap.set('n', "mc", function() compile() end)
vim.keymap.set('n', "mr", function() make('run') end)
vim.keymap.set('n', "mt", function() make('test') end)
vim.keymap.set('n', "mh", ":! make -f /Users/carlorosso/.config/Makefile help<CR>")

vim.keymap.set('n', "<leader>mr", ":! make run<CR>")
vim.keymap.set('n', "<leader>mC", ":! make clean<CR>")


-- cargo
vim.keymap.set('n', ",b", ":! cargo build<CR>")
vim.keymap.set('n', ",r", ":! cargo run<CR>")
vim.keymap.set('n', ",t", ":! cargo test<CR>")

-- TroubleToggle
vim.keymap.set('n', '<space>t', ":TroubleToggle document_diagnostics<CR>")
vim.keymap.set('n', ';t', ":TroubleToggle workspace_diagnostics<CR>")

-- undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- fugitive
vim.keymap.set('n', '<leader>g', ":Git<CR>")

-- copilot
vim.keymap.set('n', '<leader>c', ":Copilot panel<CR>")
