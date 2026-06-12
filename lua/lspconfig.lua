local function set_popup_border(winid)
	if winid and winid >= 0 and vim.api.nvim_win_is_valid(winid) then
		pcall(vim.api.nvim_win_set_config, winid, { border = "rounded" })
	end
end

vim.api.nvim_create_autocmd("CompleteChanged", {
	group = vim.api.nvim_create_augroup("CompletionPopupBorder", { clear = true }),
	callback = function()
		vim.schedule(function()
			local info = vim.fn.complete_info({ "selected" })
			set_popup_border(info.preview_winid)
		end)
	end,
})

if vim.api.nvim__complete_set then
	local orig = vim.api.nvim__complete_set
	---@diagnostic disable-next-line: duplicate-set-field
	vim.api.nvim__complete_set = function(index, opts)
		local windata = orig(index, opts)
		set_popup_border(windata and windata.winid)
		return windata
	end
end

local function config_lsp(lsp_name, filetypes, lsp_cmd)
	vim.lsp.config[lsp_name] = {
		cmd = lsp_cmd,
		filetypes = filetypes,
	}

	vim.lsp.enable(lsp_name)
end

vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.enable("lua_ls")

config_lsp("ty", { "python" }, { "ty", "server" })
config_lsp("rust-analyzer", { "rust" }, { "rust-analyzer" })
