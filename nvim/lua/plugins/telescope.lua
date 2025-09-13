return {
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
        cond = vim.fn.executable("make") == 1,
        keys = {
            {"<leader>f", ":Telescope find_files<CR>"},
            {";f", ":Telescope live_grep<CR>"},
            {";g", ":Telescope git_files<CR>"},
            {";s", ":Telescope buffers<CR>"},
            {";q", ":Telescope quickfixhistory<CR>"},
            {"<leader>j", ":Telescope jumplist<CR>"},
        }
    },
}
