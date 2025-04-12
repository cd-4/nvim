return {
  "cd-4/vim-yamove",
  config = function()
    vim.g.enableYaMoveOnMultipleHits = 1
    vim.g.enableYaMoveSmartFolds = 1
    vim.g.enableYaMoveCloseOnMoveOut = 0

    vim.keymap.set("n", "<C-j>", vim.cmd.YaMoveDown)
    vim.keymap.set("n", "<C-k>", vim.cmd.YaMoveUp)
    vim.keymap.set("n", "<C-h>", vim.cmd.YaMoveOut)
    vim.keymap.set("n", "<C-l>", vim.cmd.YaMoveIn)

    vim.keymap.set("n", "<C-n>", vim.cmd.YaMoveOutDown)
    vim.keymap.set("n", "<C-p>", vim.cmd.YaMoveInUp)
  end,
}
