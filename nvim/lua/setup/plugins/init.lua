    vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use "sharkdp/fd"
    use "nvim-telescope/telescope.nvim"
    use {
        'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
	use "nvim-treesitter/playground"
    use "ThePrimeagen/harpoon"
	use "mbbill/undotree"
	use "tpope/vim-fugitive"
    use "kyoh86/vim-ripgrep"
    use "williamboman/mason.nvim"
	use 'williamboman/mason-lspconfig.nvim'
	use "neovim/nvim-lspconfig"
    use "rust-lang/rust.vim"
    use 'folke/trouble.nvim'
	use 'folke/tokyonight.nvim'
	use 'github/copilot.vim'
end)
