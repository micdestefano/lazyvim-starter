local dap = require("dap")

return {
    "mfussenegger/nvim-dap",

    -- stylua: ignore
    keys = {
        { "<F9>", function() dap.continue() end, desc = "Continue (dbg)" },
        { "<F8>", function() dap.step_over() end, desc = "Step over (dbg)" },
        { "<F7>", function() dap.step_into() end, desc = "Step into (dbg)" },
        { "<S-F8>", function() dap.step_out() end, desc = "Step out (dbg)" },
        { "<S-F9>", function() dap.run_to_cursor() end, desc = "Run to cursor (dbg)" },
        { "<leader>dD", function() dap.clear_breakpoints() end, desc = "Delete all breakpoints" },
    },
}
