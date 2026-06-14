return {
    -- NOTE: At present I've not configured extensions. When confident, add necessary
    {
        "olimorris/codecompanion.nvim",
        version = "*", -- This settings means "always use the latest stable version"
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        -- NOTE: Keymaps beginning with <leader>a are left undefined by LazyVim with the
        --       exact purpose of being used for AI tools (explained by Gemini). Pay
        --       atthention that other plugins, like avante, define these combinations, so
        --       we cannot install also avante together with codecompanion (and I won't do
        --       that).
        keys = {
            {
                "<leader>ac",
                "<cmd>CodeCompanionChat Toggle<cr>",
                desc = "AI Chat (CodeCompanion)",
                mode = { "n", "v" },
            },
            {
                "<leader>ai",
                "<cmd>CodeCompanion<cr>",
                desc = "AI Inline (CodeCompanion)",
                mode = "n",
            },
            {
                "<leader>ai",
                ":CodeCompanion<cr>",
                desc = "AI Inline Refactor (CodeCompanion)",
                mode = "v",
            },
        },
        opts = {
            interactions = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "gemma4:e2b",
                    },
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "gemma4:e2b",
                    },
                },
            },
        },
        adapters = {
            http = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "ollama",
                        -- The following is not needed because codecompanion
                        -- reads the OLLAMA_HOST env var
                        -- env = {
                        --     url = "http://deathstar:11434",
                        -- },
                        parameters = {
                            num_predict = 4096,
                        },
                        opts = {
                            timeout = 60,
                        },
                    })
                end,
            },
        },
    },
}
