-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.scrolloff = 10
opt.shiftwidth = 4
opt.tabstop = 4
opt.textwidth = 90
opt.colorcolumn = "91"

-- Python LSP (pyright) configurations

-- Extends pyright's config
local pyright_cfg = {
    settings = {
        python = {
            analysis = {
                -- The following avoids warnings when importing symbols that are
                -- considered as "non-public" (e.g. when a symbol is not listed into the
                -- __all__ array of exports)
                diagnosticSeverityOverrides = {
                    reportPrivateImportUsage = "none",
                },
                -- here I could set other options if I need
            },
        },
    },
}

vim.lsp.config("pyright", pyright_cfg)
