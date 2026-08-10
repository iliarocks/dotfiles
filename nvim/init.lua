-- Editing

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 4

-- Appearance

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.cmd.colorscheme("habamax")

-- Diagnostics

vim.diagnostic.config({
  underline = true,
  signs = true,
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
  },
})

-- Packages

vim.g["conjure#mapping#doc_word"] = "K"

vim.pack.add({
  "https://github.com/Olical/conjure",
})

-- Language Servers

local function show_lsp_hover()
  vim.lsp.buf.hover({
    max_width = 80,
    max_height = 20,
  })
end

vim.lsp.config("*", {
  on_attach = function(_, buffer)
    vim.keymap.set("n", "K", show_lsp_hover, {
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
