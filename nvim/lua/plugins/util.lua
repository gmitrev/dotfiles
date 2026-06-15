return {
	"tpope/vim-sleuth",
	"tpope/vim-repeat",
	"tpope/vim-surround",

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			-- require("mini.surround").setup()

			-- require("mini.tabline").setup({})
			require("mini.trailspace").setup()
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					if vim.bo.filetype == "markdown" then
						return
					end
					MiniTrailspace.trim()
				end,
			})
		end,
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("cheatsheet").setup({
				bundled_cheatsheets = {
					disabled = { "nerd-fonts", "unicode", "regex", "markdown" },
				},
			})

			vim.keymap.set("n", "<leader>h", ":Cheatsheet<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
		end,
		opts = {},
	},
}
