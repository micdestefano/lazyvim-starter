return {
    {
        "mfussenegger/nvim-lint",
        opts = function(_, opts)
            -- Fetch the global textwidth option from Neovim options
            local current_textwidth = vim.opt.textwidth:get()

            -- Fallback to a default value if textwidth is not set or equals 0
            local max_line_length = (current_textwidth > 0) and current_textwidth or 80

            -- Ensure the linters table exists
            opts.linters = opts.linters or {}

            -- Configure markdownlint-cli2 globally to use 90 columns
            opts.linters["markdownlint-cli2"] = {
                args = {
                    "--config",
                    '{"config":{"MD013":{"line_length":' .. max_line_length .. "}}}",
                },
            }

            -- Return the modified table to LazyVim
            return opts
        end,
    },
}
