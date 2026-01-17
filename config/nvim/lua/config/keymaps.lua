local map = vim.keymap.set

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>f", function()
  require("conform").format()
end, { desc = "Format" })

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
