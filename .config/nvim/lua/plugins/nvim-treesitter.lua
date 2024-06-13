-- Code Tree Support / Syntax Highlighting
return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "erlang",
                    "java",
                    "json",
                    "html",
                    "python",
                    "go",
                    "bash",
                    "markdown",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    }

