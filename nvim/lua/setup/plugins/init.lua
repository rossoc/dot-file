    vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use "sharkdp/fd"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "kyoh86/vim-ripgrep"
    use "williamboman/mason.nvim"
    use "nvim-telescope/telescope.nvim"
    use {
        'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
        }
    use "ThePrimeagen/harpoon"
    use "rust-lang/rust.vim"
    use "neovim/nvim-lspconfig"
    use 'puremourning/vimspector'
end)
