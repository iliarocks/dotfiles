require("config.options")
require("config.keymaps")
require("config.lazy")

-- mute errors
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:loaded_python3_provider = 0")

-- language server providers
vim.lsp.enable({
	"luals",
	"tsserver",
	"tailwind",
})

-- dignostic behaviour
vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		source = "always",
		header = "",
		focusable = false,
	},
})

-- show diagnostic pop-up on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float()
	end,
})

-- make diagnostic pop-up faster
vim.opt.updatetime = 500

-- prevent flashing on insert
vim.opt.signcolumn = "yes:1"

-- set colorscheme
vim.cmd.colorscheme("catppuccin")
