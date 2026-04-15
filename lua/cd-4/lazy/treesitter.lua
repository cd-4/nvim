
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- No .setup() with all those options anymore

    -- Install parsers you want (manual now)
    vim.cmd("TSInstall! markdown markdown_inline lua vimdoc javascript typescript c rust python go tsx rust jsdoc bash")

    -- Enable Treesitter highlighting for most files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "lua", "python", "rust", "typescript", "javascript", "c", "go", "lua"},  -- add your languages
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
