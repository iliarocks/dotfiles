return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      css = { "biome" },
      html = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      lua = { "stylua" },
      sh = { "shfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
  },
}
