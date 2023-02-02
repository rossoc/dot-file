local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable "make" == 1,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"kyoh86/vim-ripgrep",
	{ "neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	"folke/trouble.nvim",
	"github/copilot.vim",

})


--    vim.cmd [[packadd packer.nvim]]
--
--return require('packer').startup(function(use)
--  -- Packer can manage itself
--    use 'wbthomason/packer.nvim'
--    use "nvim-lua/plenary.nvim"
--    use "sharkdp/fd"
--    use "nvim-telescope/telescope.nvim"
--    use {
--        'nvim-telescope/telescope-fzf-native.nvim',
--        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
--        }
--    use {
--        "nvim-treesitter/nvim-treesitter",
--        run = ":TSUpdate",
--    }
--	use "nvim-treesitter/playground"
--    use "ThePrimeagen/harpoon"
--	use "mbbill/undotree"
--	use "tpope/vim-fugitive"
--    use "kyoh86/vim-ripgrep"
--    use "williamboman/mason.nvim"
--	use 'williamboman/mason-lspconfig.nvim'
--	use "neovim/nvim-lspconfig"
--    use "rust-lang/rust.vim"
--    use 'folke/trouble.nvim'
--	use 'folke/tokyonight.nvim'
--	use 'github/copilot.vim'
--end)
