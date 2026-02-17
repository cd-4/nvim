return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = vim.lsp.config
    local lsp = vim.lsp

    -- Basic on_attach and capabilities (optional, improve UX)
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    lsp.config("lua_ls", {
      root_dir = require("lspconfig.util").root_pattern(".git", "lua", "init.lua"),
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
              path ~= vim.fn.stdpath("config")
              and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    lsp.config("bashls", {
      on_attach = on_attach,
    })

    lsp.config("pyright", {
      on_attach = on_attach,
    })

    lsp.config("ts_ls", {
      on_attach = on_attach,
      settings = {
        -- Add any specific settings here if needed
        tsserver = {
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx" },
        },
      },
    })


    lsp.config("rust_analyzer", {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { 'rust-analyzer' },
      filetypes = { 'rust' },
      root_markers = { "Cargo.toml", ".git" },
      single_file_support = true,
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false,
          }
        }
      },
      before_init = function(init_params, config)
        -- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
        if config.settings and config.settings['rust-analyzer'] then
          init_params.initializationOptions = config.settings['rust-analyzer']
        end
      end,
    })
  end,
}
