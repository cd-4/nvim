return {
  "skwee357/nvim-prose",
  config = function()
    require('nvim-prose').setup {
    wpm = 200,                  -- words per minute (default: 200)
    filetypes = { 'markdown', 'asciidoc', 'text' },  -- add more if needed
    placeholders = { words = 'words', minutes = 'min' },  -- customize display
  }
  end,
}
