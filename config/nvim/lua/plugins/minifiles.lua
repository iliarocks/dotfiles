return {
  'echasnovski/mini.files',
  version = "*",
  opts = {},
  keys = {
    { "<leader>cd", function() require("mini.files").open() end },
  },
}
