-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Create an autocommand group to manage textwidth exceptions
local textwidth_exception_group =
    vim.api.nvim_create_augroup("TextwidthExceptions", { clear = true })

-- Disable textwidth for specific file types
vim.api.nvim_create_autocmd("FileType", {
    group = textwidth_exception_group,
    pattern = { "json", "jsonl" }, -- Target file types
    callback = function()
        -- Disable textwidth locally for the current buffer
        vim.opt_local.textwidth = 0
        -- Optional: Hide the colorcolumn vertical line for these files
        vim.opt_local.colorcolumn = ""
    end,
})
