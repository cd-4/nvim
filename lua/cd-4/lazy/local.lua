return {
  --[[
  {
    "git-needy.nvim",
    dir = "~/repos/git-needy.nvim",
    config = function()
      require("git-needy").setup()
    end,
  },
  --]]
  {
    "cd-4/git-needy.nvim",
    config = function()
      require("git-needy").setup({
        repos = {},
      })
    end,
  },
}
