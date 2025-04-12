--[[
return {
  "alvan/vim-closetag",
  lazy = false,
  config = function()
    vim.g.closetag_filenames = {
      "*.html",
      "*.xhtml",
      "*.phtml",
      "*.svelte",
      "*.tsx",
      "*.jsx",
    }
    vim.g.closetag_filetypes = {
      "html",
      "xhtml",
      "phtml",
      "svelte",
      "typescriptreact",
      "javascriptreact",
    }
    vim.g.closetag_xhtml_filenames = { "*.jsx", "*.tsx" }
  end,
}
--]]
return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  opts = {},
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
