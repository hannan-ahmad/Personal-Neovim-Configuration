return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
			},

			format_on_save = {
				timeout_ms = 5000,
				lsp_format = "fallback",
			},
		})
	end,
}
