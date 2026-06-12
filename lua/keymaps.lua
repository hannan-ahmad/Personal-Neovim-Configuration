local map = vim.keymap.set

local autorun = function()
	local filename = vim.api.nvim_buf_get_name(0)
	local filetype = vim.bo.filetype

	if filetype == "python" then
		vim.cmd.split()
		vim.cmd.terminal("python " .. filename)
	end
end

map("n", "<leader>rn", autorun)

map("n", "<tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-tab>", ":BufferLineCyclePrev<CR>")
map("n", "<leader>x", ":bdelete<CR>")

map("n", "<leader>ff", function()
	require("snacks").picker.files()
end)

map("n", "<leader>th", function()
	require("snacks").picker.colorschemes()
end)

map("n", "<leader>fw", function()
	require("snacks").picker.grep()
end)

map("n", "<leader>e", function()
	require("snacks").explorer()
end)
