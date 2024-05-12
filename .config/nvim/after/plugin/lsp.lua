local lsp = require("lsp-zero")

lsp.preset("recommended")
-- require('java').setup()
lsp.ensure_installed({
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['gopls'] = { 'go' },
--         ['emmet_language_server'] = {
--             'html'
--         },
--         ['jsonls'] = { 'json' },
--         ['elixirls'] = { 'elixir' }
--     }
-- })
-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['gopls'] = { 'go' },
--         ['emmet_language_server'] = {
--             'html'
--         },
--         ['jsonls'] = { 'json' },
--         ['elixirls'] = { 'elixir' }
--     }
-- })
 
local on_attach = lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()", opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
                callback = function ()
                    if filetype ~= 'c' then
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end
                end
        })
    end
end)

lsp.setup( {
})
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
}
    }
})
-- require('lspconfig').jdtls.setup({})
require('lspconfig').pyright.setup({})
-- require('lspconfig').tsserver.setup({
--     on_attach = lsp.on_attach,
--     capabilities = lsp.capabilities,
--     init_options = {
--         preferences = {
--             disableSuggestions = true,
--         }
--     }
-- })


-- setting up the elixir language server
-- you have to manually specify the entrypoint cmd for elixir-ls
-- require('lspconfig').elixirls.setup {
--   cmd = { "elixir-ls" },
--   on_attach = on_attach,
--   capabilities = lsp.capabilities
-- }

local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
    sources = {
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
    }
})


lsp.setup_servers({ 'gopls' })
vim.diagnostic.config({
    virtual_text = true
})

