return {
  {
    "git-workflows.nvim",
    dir = "~/repos/git-workflows.nvim",
    config = function()
      require("git-workflows").setup()
    end,
  },
}
