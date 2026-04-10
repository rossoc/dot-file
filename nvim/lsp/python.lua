vim.lsp.config('ty', {
    settings = {
        ty = {
            completions = {
        autoImport = true,
      },
            configuration = {
                rules = {
                    ["unresolved-reference"] = "warn"
                }
            }
        },
    },
})
