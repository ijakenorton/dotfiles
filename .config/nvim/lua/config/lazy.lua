local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
local plugins = {

    'nanotee/zoxide.vim', 
    'nmac427/guess-indent.nvim',
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",                  -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim",    -- For standard functions
            "MunifTanjim/nui.nvim",     -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = true,
    },
    "LunarVim/bigfile.nvim",
    "github/copilot.vim",
    {
        'yamatsum/nvim-nonicons',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'folke/noice.nvim',
        dependencies = { { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } }

    },
    -- 'HallerPatrick/py_lsp.nvim',
    --
    -- {
    --     'linux-cultist/venv-selector.nvim',
    --     dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    --     opts = {
    --         -- Your options go here
    --         -- name = "venv",
    --         -- auto_refresh = false
    --     },
    --     event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    --     keys = {
    --         -- Keymap to open VenvSelector to pick a venv.
    --         { '<leader>vs', '<cmd>VenvSelect<cr>' },
    --         -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    --         { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    --     },
    -- },
    { "elixir-tools/elixir-tools.nvim",      tag = "stable", dependencies = { "nvim-lua/plenary.nvim" } },
    "tpope/vim-surround",
    "mg979/vim-visual-multi",
    "vim-scripts/ReplaceWithRegister",
    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
    {
        "folke/trouble.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        },
    },
    -- {
    --     'nvim-java/nvim-java',
    --     dependencies = {
    --         'nvim-java/lua-async-await',
    --         'nvim-java/nvim-java-core',
    --         'nvim-java/nvim-java-test',
    --         'nvim-java/nvim-java-dap',
    --         'MunifTanjim/nui.nvim',
    --         'neovim/nvim-lspconfig',
    --         'mfussenegger/nvim-dap',
    --         {
    --             'williamboman/mason.nvim',
    --             opts = {
    --                 registries = {
    --                     'github:nvim-java/mason-registry',
    --                     'github:mason-org/mason-registry',
    --                 },
    --             },
    --         }
    --     },
    -- },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} },
    {
        "nvim-tree/nvim-tree.lua",
    },
    { "ellisonleao/gruvbox.nvim" },
    {
        "lervag/vimtex",
        init = function()
            -- Use init for configuration, don't use the more common "config".
        end
    },
    {
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
                    "heex",
                    "eex",
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
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- "windwp/nvim-autopairs",
    'theprimeagen/harpoon',
    'ThePrimeagen/vim-be-good',
    'mbbill/undotree',
    'jose-elias-alvarez/null-ls.nvim',
    -- { "rcarriga/nvim-dap-ui",      dependencies = { "mfussenegger/nvim-dap" } },
    -- { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                opts = {
                    PATH = "append",
                    servers = {
                        python = {
                            false
                        }
                    },
                    ensure_installed = {
                        "eslint_d",
                        "js-debug-adapter",
                        "prettier_d",
                        "tsserver",
                    }
                }
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    },
    'jayp0521/mason-null-ls.nvim',
    "nvim-lualine/lualine.nvim",
    "lewis6991/gitsigns.nvim",
    'Aasim-A/scrollEOF.nvim',
}
local opts = {}
require("lazy").setup(plugins, opts)
