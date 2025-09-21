return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "*",
	opts = {
		keymap = {
			["<Tab>"] = { "accept", "fallback" },
		},
		sources = {
			default = { "lsp", "path" },
		},
	},
}
