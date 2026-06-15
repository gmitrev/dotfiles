return {
	{
		"saghen/blink.cmp",
		dependencies = {},

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "super-tab",
				-- Docs auto-show (completion.documentation.auto_show). The old <C-?>
				-- binding was dropped: terminals can't transmit it (arrives as <C-_>)
				-- and <C-Space> is grabbed by the OS. <C-d>/<C-u> scroll the doc panel
				-- when it's open and fall back to normal insert-mode behaviour otherwise.
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
			},

			appearance = {
				nerd_font_variant = "normal",
				use_nvim_cmp_as_default = false,
			},

			completion = {
				accept = { auto_brackets = { enabled = true } },
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,
					treesitter_highlighting = true,
					window = { border = "rounded" },
				},

				menu = {
					border = "rounded",

					draw = {
						treesitter = { "lsp" },
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Parameter hints shown while typing inside (...). Toggle in insert
			-- mode with <C-k> — but note <C-k> is remapped to select_prev above,
			-- so use the hover/signature window or :lua vim.lsp.buf.signature_help().
			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
