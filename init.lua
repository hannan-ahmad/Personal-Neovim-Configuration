vim.g.mapleader = " "

require("preferences")
require("lazy-install")
require("keymaps")
require("lspconfig")

vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		pcall(vim.cmd.colorscheme, vim.g.SCHEME)
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function(params)
		vim.g.SCHEME = params.match

		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				show_buffer_icons = true,
				show_close_icon = true,
				separator_style = "slant",

				indicator = {
					style = "underline",
				},

				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})
	end,
})
