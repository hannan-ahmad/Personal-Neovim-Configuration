return {
	"rachartier/tiny-inline-diagnostic.nvim",
	priority = 1,
	lazy = false,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",

			options = {
				multilines = {
					enabled = true,
					always_show = true,
				},

				enable_on_insert = true,
				enable_on_select = true,

				show_source = {
					enabled = true,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
