return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- Note the "s" at the end of configs
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                -- A list of parser names, or "all"
                ensure_installed = { "lua", "rust", "toml", "cpp", "python", "go" },

                -- Install parsers synchronously
                sync_install = true,

                -- Automatically install missing parsers
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })

            -- Autocmd for Python/Notebook highlighting
            vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
                pattern = { "python" },
                callback = function(args)
                    local bufnr = args.buf
                    vim.schedule(function()
                        if vim.api.nvim_buf_is_valid(bufnr) then
                            pcall(vim.treesitter.start, bufnr, "python")
                        end
                    end)
                end,
            })
        end,
    },
}
