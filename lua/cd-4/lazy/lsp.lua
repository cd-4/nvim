return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

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

    lspconfig.pyright.setup({
      on_attach = on_attach,
    })

    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      settings = {
        -- Add any specific settings here if needed
        tsserver = {
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx" },
        },
      },
    })
  end,
}
