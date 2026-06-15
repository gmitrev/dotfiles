return {
	"vim-ruby/vim-ruby",
	"tpope/vim-endwise",
	{
		"tpope/vim-rails",
		config = function()
			vim.api.nvim_create_autocmd("FileType", { pattern = "eruby.yaml", command = "set filetype=yaml" })
		end,
	},
	{
		"vim-test/vim-test",
		dependencies = {
			"benmills/vimux",
		},
		config = function()
			vim.g["test#strategy"] = "vimux"
		end,
		keys = {
			{ "<leader>tt", ":TestFile<cr>", desc = "Test current file" },
			{ "<leader>ts", ":TestNearest<cr>", desc = "Test current file" },
		},
	},
	{
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_dont_ask_default = 1
			vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }

			-- Key mappings for Slime
			vim.keymap.set({ "n", "v" }, "<Leader>r", "<Plug>SlimeLineSend", {})
			vim.keymap.set({ "n", "v" }, "<Leader>e", "<Plug>SlimeRegionSend", {})
		end,
	},
}
