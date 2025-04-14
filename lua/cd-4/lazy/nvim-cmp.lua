return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completion source
    "hrsh7th/cmp-buffer", -- Buffer words
    "hrsh7th/cmp-path", -- File system paths
    "hrsh7th/cmp-cmdline", -- Command line
    "L3MON4D3/LuaSnip", -- Snippets
    "saadparwaiz1/cmp_luasnip", -- Snippet completion
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local next_suggestion = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" })

    local prev_suggestion = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Next Suggestion
        ["<C-j>"] = next_suggestion,
        ["<Tab>"] = next_suggestion,
        -- Prev Suggestion
        ["<C-k>"] = prev_suggestion,
        ["<S-Tab>"] = prev_suggestion,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
