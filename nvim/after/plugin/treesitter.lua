require('nvim-treesitter.config').setup({
    -- A list of parser names, or "all"
    ensure_installed = { "lua", "rust", "toml", "cpp", "python", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    pattern = { "python" }, -- Since your .ipynb already identifies as python
    callback = function(args)
        -- We only want to trigger this if it's not already highlighting
        -- and specifically for notebooks or python files
        local bufnr = args.buf
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(bufnr) then
                -- This 'pcall' prevents the error from popping up if the buffer is busy
                pcall(vim.treesitter.start, bufnr, "python")
            end
        end)
    end,
})
