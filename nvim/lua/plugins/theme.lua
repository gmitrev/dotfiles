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

			-- +/- diff lines (commit buffer, fugitive, etc.) need a bg tint on light gruvbox
			local function diff_hl()
				vim.api.nvim_set_hl(0, "diffAdded", { fg = "#427b58", bg = "#dcecca" })
				vim.api.nvim_set_hl(0, "diffRemoved", { fg = "#9d0006", bg = "#f5d9d6" })
				vim.api.nvim_set_hl(0, "Added", { link = "diffAdded" }) -- nvim default group
				vim.api.nvim_set_hl(0, "Removed", { link = "diffRemoved" })
				vim.api.nvim_set_hl(0, "@diff.plus", { link = "diffAdded" }) -- treesitter diff
				vim.api.nvim_set_hl(0, "@diff.minus", { link = "diffRemoved" })
			end
			diff_hl()
			vim.api.nvim_create_autocmd("ColorScheme", { callback = diff_hl })
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
