
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- -- Make Nvim Tree thinner
    vim.api.nvim_set_keymap('n', '<C-->', ':NvimTreeResize -5<CR>', { noremap = true, silent = true })

    -- -- Make Nvim Tree wider
    vim.api.nvim_set_keymap('n', '<C-p>', ':NvimTreeResize +5<CR>', { noremap = true, silent = true })
    -- local api = require "nvim-tree.api"
end
-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },

  opts = {
    on_attach = my_on_attach,
    view = {
        width = 35,
    },
    renderer = {
        indent_width = 4,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        special_files = {},
        icons = {
            show = {
                file = false,
                git = false,
                modified = false,
                folder_arrow = false,
            },
        },
    },
    filters = {
        dotfiles = false,
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        severity = {
            min = vim.diagnostic.severity.INFO,
            max = vim.diagnostic.severity.ERROR,
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
},
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

