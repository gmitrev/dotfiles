# AGENTS.md

Operational reference for LLM agents editing this Neovim config.

## Stack

- Neovim (Lua config)
- Plugin manager: `lazy.nvim` (auto-bootstrapped in `init.lua`)
- Plugin specs live in `lua/plugins/*.lua` — each file returns a list of specs and is auto-loaded by `require("lazy").setup("plugins", ...)` in `init.lua:16`
- LSP via `nvim-lspconfig` + `mason.nvim` + `mason-tool-installer`
- Completion: `blink.cmp` (super-tab preset)
- Theme: `gruvbox` light
- Leader key: `,` (both `mapleader` and `maplocalleader`)

## Layout

```
init.lua                  Bootstraps lazy.nvim, requires user/* modules
lua/user/editor.lua       vim.opt globals (number, indent, clipboard, etc.)
lua/user/keymappings.lua  Non-plugin keymaps (window nav, leader, jj→Esc)
lua/plugins/*.lua         One file per plugin grouping; each returns specs
lazy-lock.json            Pinned plugin versions (commit on changes)
cheatsheet.txt            Scratch; not loaded
usage_data.json           Written by usage-tracker.nvim; never edit
```

## Plugin file responsibilities

| File              | Purpose                                                   |
| ----------------- | --------------------------------------------------------- |
| `completion.lua`  | `blink.cmp` config                                        |
| `default.lua`     | Misc UI (zen-mode)                                        |
| `fun.lua`         | usage-tracker                                             |
| `git.lua`         | gitsigns, blame.nvim, gitportal                           |
| `llm.lua`         | LLM integrations (currently all commented out)            |
| `lsp.lua`         | LSP servers, Mason, diagnostics, `LspAttach` keymaps      |
| `navigation.lua`  | telescope, neo-tree, tabby, easymotion                    |
| `ruby.lua`        | vim-rails, vim-test, vim-slime, endwise                   |
| `syntax.lua`      | treesitter, conform (formatter), autopairs, ts-autotag    |
| `tailwind.lua`    | tailwind-tools + nvim-highlight-colors                    |
| `theme.lua`       | gruvbox + lualine                                         |
| `util.lua`        | vim-sleuth, surround, mini.nvim, easy-align, cheatsheet   |

## Adding a plugin

1. Pick the appropriate `lua/plugins/*.lua` (don't create new files unless the grouping is genuinely new).
2. Append a spec to the returned table:
   ```lua
   {
     "author/repo",
     opts = { ... },
   }
   ```
3. Restart nvim or `:Lazy sync`. Commit `lazy-lock.json`.

## Adding an LSP server

Edit `lua/plugins/lsp.lua` — add an entry to the `servers` table (around line 127). Mason auto-installs everything keyed in `servers`. Each value is the `lspconfig` setup table. Capabilities from `blink.cmp` are merged in automatically.

## Adding a formatter

Edit `lua/plugins/syntax.lua` — add to `formatters_by_ft` in the `conform.nvim` opts (around line 66). Formatters run on save (3s timeout, LSP fallback).

## Conventions

- **Leader is `,`** — every leader keymap in this repo assumes that.
- **Indent**: 2-space, expandtab (`lua/user/editor.lua:24-26`). Treesitter handles indent except for `ruby` and `scss` (disabled list in `syntax.lua:41`).
- **Format on save**: enabled globally via conform. Timeout 3s, falls back to LSP. Trailing whitespace stripped via `mini.trailspace` (skipped for markdown).
- **Stylua** formats this repo's Lua. Settings inferred by `vim-sleuth`.
- **No notify on lazy change detection** (`init.lua:16`).

## Common pitfalls

- `<C-j>` / `<C-k>` are bound twice in `keymappings.lua`: once for window nav (lines 11-12), then overridden for line move (lines 15-16). Line-move wins. Don't "fix" this without checking intent.
- `<leader>t` opens a new tab (`navigation.lua:46`) AND prefixes `<leader>tt`/`<leader>ts`/`<leader>tc`/`<leader>to`/`<leader>tmp`/`<leader>tmn`. Keep the timeout (`editor.lua:17` → 300ms) in mind when adding new `<leader>t*` maps.
- `tailwind-tools.nvim` is loaded but configured to **not** override the LSP — `lsp.lua` owns `tailwindcss` setup. Don't add `tailwindcss` server config inside `tailwind.lua`.
- `mason-lspconfig` `ensure_installed` is intentionally empty; installs are driven by `mason-tool-installer` from the `servers` table keys (`lsp.lua:155-162`).
- The user's global `CLAUDE.md` enforces strict policies for any Rails/Tailwind project work — those policies are project-side, not nvim-config-side, but if asked to write example snippets, honor them.

## Don't

- Create new top-level files unless asked.
- Add `.md` docs unless explicitly requested.
- Modify `lazy-lock.json` by hand.
- Add per-language config files outside `lua/plugins/*.lua` without checking with the user.
- Re-enable commented-out plugins in `llm.lua` or `theme.lua` without asking.
