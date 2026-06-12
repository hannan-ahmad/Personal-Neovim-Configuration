return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup()

		require("nvim-web-devicons").set_icon({
			py = {
				icon = "󰌠",
				color = "#FFD43B", -- primary color (yellow)
				cterm_color = "220",
				name = "Python",
			},
		})
	end,
}
