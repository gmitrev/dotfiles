return {
	-- {
	--   'folke/tokyonight.nvim',
	--   priority = 1000, -- Make sure to load this before all the other start plugins.
	--   config = function()
	--     ---@diagnostic disable-next-line: missing-fields
	--     require('tokyonight').setup {
	--       styles = {
	--         comments = { italic = false }, -- Disable italics in comments
	--       },
	--     }
	--
	--     -- Load the colorscheme here.
	--     -- Like many other themes, this one has different styles, and you could load
	--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	--     vim.cmd.colorscheme 'tokyonight-day'
	--   end,
	-- },
	{
		"morhetz/gruvbox",
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.g.gruvbox_contrast_light = "medium"
			vim.g.gruvbox_italic = 0
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				theme = "gruvbox_light",
				sections = {
					lualine_c = { "branch", "diff", "diagnostics" },
					lualine_b = { "filename" },
				},
			})
		end,
	},
}
