return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {
			server = {
				override = false, -- let lsp.lua handle tailwindcss setup
			},
			document_color = {
				enabled = true,
				kind = "inline", -- "background" | "foreground" | "inline"
				inline_symbol = "󰝤 ",
				debounce = 200,
			},
			conceal = {
				enabled = false, -- off by default; toggle with :TailwindConcealEnable
				min_length = nil,
				symbol = "󱏿",
				highlight = { fg = "#38BDF8" },
			},
			cmp = {
				highlight = "foreground", -- "foreground" | "background"
			},
		},
		keys = {
			{ "<leader>tc", "<cmd>TailwindConcealToggle<cr>", desc = "[T]ailwind [C]onceal toggle" },
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			render = "background", -- "background" | "foreground" | "virtual"
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
}
