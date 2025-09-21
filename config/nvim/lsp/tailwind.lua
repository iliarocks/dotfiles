return {
	cmd = { "bunx", "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"css",
		"javascriptreact",
		"typescriptreact",
	},
	root_markers = { "tailwind.config.ts", "tailwind.config.js", "postcss.config.js", "package.json", ".git" },
}
