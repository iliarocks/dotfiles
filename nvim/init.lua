vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 4

vim.cmd.colorscheme("habamax")

vim.diagnostic.config({
  underline = true,
  signs = true,
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
  },
})

vim.g["conjure#mapping#doc_word"] = "K"

vim.pack.add({
  "https://github.com/Olical/conjure",
})

vim.lsp.config("*", {
  on_attach = function(_, buffer)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        max_width = 80,
        max_height = 20,
      })
    end, {
    buffer = buffer,
    desc = "LSP hover",
  })
end,
})

vim.lsp.config("clojure_lsp", {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure" },
  root_markers = { "deps.edn", ".git" },
})

vim.lsp.enable("clojure_lsp")
