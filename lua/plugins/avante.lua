return {
    {
        "yetone/avante.nvim",
        opts = {
            provider = "ollama",
            providers = {
                ollama = {
                    -- Export the following environment variables to customize
                    -- configuration
                    endpoint = vim.env.AVANTE_OLLAMA_URL or "http://127.0.0.1:11434",
                    model = vim.env.AVANTE_OLLAMA_MODEL or "gemma4:e4b",
                    -- The following is mandatory for Ollama, but I implemented
                    -- differently from what's suggested into the plugin documentation
                    -- because I want to be able to connect to an Ollama server on another
                    -- machine in my LAN
                    is_env_set = function()
                        return true
                    end,
                },
            },
        },
    },
}
