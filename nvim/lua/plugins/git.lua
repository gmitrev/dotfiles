return {
	{
		"trevorhauter/gitportal.nvim",
		opts = {
			always_include_current_line = true,
		},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})

			vim.keymap.set("n", "<leader>b", ":BlameToggle window<CR>")
		end,
	},
}
