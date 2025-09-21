return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 2000,
		},
		notify_on_error = false,
		formatters_by_ft = {
			-- Biome handles these
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome" },
			jsonc = { "biome" },
			css = { "biome" },

			-- Biome doesn't support these yet, keeping prettier as fallback
			html = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },

			-- for neovim config
			lua = { "stylua" },
			-- for shell scripts
			sh = { "shfmt" },
		},
	},
}
