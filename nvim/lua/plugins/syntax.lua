return {
	"jiangmiao/auto-pairs",
	"kchmck/vim-coffee-script",
	"slim-template/vim-slim",
	"RRethy/nvim-treesitter-endwise",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		dependencies = {
			"windwp/nvim-ts-autotag", -- Without this dependency set, auto tag completion would not work... for me
		},
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"scss",
				"vim",
				"vimdoc",
				"ruby",
				"rust",
				"embedded_template",
				"typescript",
				"tsx",
				"javascript",
				"json",
				"jsonc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby", "scss" } },
		},
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>a",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = function()
			-- Prettier for JS/TS/JSON; prefers the project-local binary, falls
			-- back to a global one. prettierd is fast and picks up the project's
			-- prettier config + plugins.
			local prettier = { "prettierd", "prettier", stop_after_first = true }
			return {
				notify_on_error = false,
				format_on_save = function()
					return {
						timeout_ms = 3000,
						lsp_format = "fallback",
					}
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = prettier,
					javascriptreact = prettier,
					typescript = prettier,
					typescriptreact = prettier,
					json = prettier,
					jsonc = prettier,
					eruby = { "erb_format" },
					rust = { "rustfmt", lsp_format = "fallback" },
					ruby = {
						-- "standardrb", -- Very fucking slow
						-- "rubocop", -- Also very fucking slow
						stop_after_first = true,
					},
					["_"] = { "trim_whitespace" },
				},
			}
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "Avante", "codecompanion" },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"xml",
					"eruby",
					"embedded_template",
					"javascriptreact",
					"typescriptreact",
				},
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
			})
		end,
	},
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"folke/snacks.nvim", -- optional
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
