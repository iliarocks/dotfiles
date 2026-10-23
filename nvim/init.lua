vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Editing

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 4
vim.opt.completeopt = { "menuone", "noselect", "popup" }

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
vim.g["conjure#completion#omnifunc"] = false

vim.pack.add({
  "https://github.com/Olical/conjure",
  "https://github.com/nvim-mini/mini.pick",
  "https://github.com/nvim-mini/mini.files",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

-- Navigation

local pick = require("mini.pick")
local files = require("mini.files")

pick.setup()
files.setup()

vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", pick.builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", pick.builtin.grep_live, { desc = "Search text" })
vim.keymap.set("n", "<leader>fe", files.open, { desc = "Explore files" })
vim.keymap.set("n", "<leader>gb", "<C-o>", { desc = "Go back" })

-- Language Servers

vim.lsp.on_type_formatting.enable()

local function show_lsp_hover()
  vim.lsp.buf.hover({
    max_width = 80,
    max_height = 20,
  })
end

vim.lsp.config("*", {
  on_attach = function(client, buffer)
    if client:supports_method("textDocument/completion") then
      vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
      local completion = client.server_capabilities.completionProvider
      completion.triggerCharacters = completion.triggerCharacters or {}
      -- Request suggestions while typing names, as well as server-provided triggers.
      vim.list_extend(completion.triggerCharacters,
        vim.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-?!", ""))
      vim.list.unique(completion.triggerCharacters)
      vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })

      vim.keymap.set("i", "<Tab>", function()
        if vim.fn.pumvisible() == 0 then return "<Tab>" end
        return vim.fn.complete_info().selected == -1 and "<C-n><C-y>" or "<C-y>"
      end, { buffer = buffer, expr = true, desc = "Accept completion" })

      vim.keymap.set("i", "<CR>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><CR>" or "<CR>"
      end, { buffer = buffer, expr = true, desc = "Insert newline" })
    end

    vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { buffer = buffer, desc = "Code definition" })
    vim.keymap.set("n", "<leader>ch", show_lsp_hover, { buffer = buffer, desc = "Code help" })
    vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { buffer = buffer, desc = "Code errors" })
  end,
})

vim.lsp.config("clojure_lsp", {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure" },
  root_markers = { "deps.edn", ".git" },
})

vim.lsp.config("racket_langserver", {
  cmd = { "racket", "-l", "racket-langserver" },
  filetypes = { "racket" },
  root_markers = { "info.rkt", ".git" },
})

vim.lsp.enable({ "clojure_lsp", "racket_langserver" })
