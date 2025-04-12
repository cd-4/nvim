return {
  {
    "alvan/vim-closetag",
    config = function()
      vim.g.closetag_filenames = {
        "*.html",
        "*.xhtml",
        "*.phtml",
        "*.svelte",
        "*.tsx",
        "*.jsx",
      }
    end,
  },
}
