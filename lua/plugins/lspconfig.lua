return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp'
  },

  config = function()
    local lspconfig = require('lspconfig')
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    -- Mason setup
    mason.setup()

    -- Mason-LSPconfig setup
    mason_lspconfig.setup({
      ensure_installed = {
        'lua_ls',
        'pyright',
        'gopls',
        'jdtls',
        'rust_analyzer',
      },
    })

    -- Configure handlers for Mason-LSPconfig
    mason_lspconfig.setup_handlers({
      function(server_name)
        -- Skip setup for jdtls as it will be configured separately
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = function(_, bufnr)
              local opts = { buffer = bufnr }

              -- LSP-specific key mappings
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
              vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
              vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
              vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
              vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end, opts)
              vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
              vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
              vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          })
        end
      end,
    })

    -- Lua language server configuration
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    -- Floating preview customization
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return open_floating_preview(contents, syntax, opts, ...)
    end

    -- Global diagnostic mappings
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- LspAttach autocommand for buffer-specific mappings
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      end,
    })
  end,
}
