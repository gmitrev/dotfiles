return {
	{
		"folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<Leader>zm", ":ZenMode<CR>", {})
		end,
		opts = {
			window = {
				width = 300,
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
