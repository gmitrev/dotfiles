# Neovim Toolchain Cheatsheet

How the LSP / completion / formatting / lint / syntax stack is wired, what each
piece does, and how to confirm it's actually working in a given project.

See `README.md` for the full keybinding tables and plugin list. This file is the
"why isn't it working here?" reference.

## The mental model

A file opens → its **filetype** is detected → that drives four independent systems:

| System          | Plugin                | Gives you                          | Per-project dependency |
| --------------- | --------------------- | ---------------------------------- | ---------------------- |
| **Diagnostics + nav** | LSP servers (lspconfig) | errors, hover, go-to-def, rename, completion source | server binary + project's `node_modules` / SDK |
| **Completion**  | blink.cmp             | the popup menu; pulls from LSP, path, snippets, buffer | none (uses LSP above) |
| **Formatting**  | conform.nvim          | reformat on save                   | formatter binary (prefers project-local) |
| **Syntax/indent** | nvim-treesitter     | highlight, indent, `%` motions, autotag | parser (auto-installs) |

They don't depend on each other. Treesitter highlights even with no LSP; conform
formats even if the LSP is dead. So when something's off, **isolate which of the
four it is first.**

## Who installs what

- **Mason** (`:Mason`) installs the *binaries* — LSP servers, formatters, linters —
  into `~/.local/share/nvim/mason/`. It is NOT a plugin manager.
- **mason-tool-installer** auto-installs a fixed list on startup. The list is built
  in `lua/plugins/lsp.lua` from the `servers` table keys + a few extras (`stylua`,
  `prettierd`). **Add an LSP server here by adding it to the `servers` table.**
- **mason-lspconfig (v2)** auto-*enables* installed servers via `vim.lsp.enable()`.
  > ⚠️ v2 dropped the old `handlers = {...}` callback. Per-server `settings` /
  > `capabilities` are now registered with `vim.lsp.config(name, cfg)` in a loop in
  > `lsp.lua`. If you copy a `handlers`-based snippet from the internet, it will be
  > **silently ignored** — servers attach but your settings never apply.
- **lazy.nvim** (`:Lazy`) manages the Lua plugins themselves.
- **Treesitter parsers** auto-install (`auto_install = true`); the explicit list in
  `syntax.lua` just guarantees them up front.

## Adding support for a new language

1. **LSP**: add the lspconfig server name to the `servers` table in `lsp.lua`
   (e.g. `gopls = {}`). Restart → mason-tool-installer pulls the binary.
2. **Formatter**: add `filetype = { "formatter" }` to `formatters_by_ft` in
   `syntax.lua`, and add the formatter to the `prettierd`-style install list in
   `lsp.lua` if Mason should manage it.
3. **Linter** (if separate from LSP): same as LSP — many ship as a language server
   (e.g. `eslint`).
4. **Treesitter**: usually nothing — `auto_install` handles it. Add to
   `ensure_installed` to force it.

## Verifying a project from cold

Run these in order in a file of the target type. Each isolates one layer.

```vim
:checkhealth          " global: mason, treesitter, lsp, conform sections
:LspInfo              " which servers attached to THIS buffer + their settings
:ConformInfo          " which formatter will run on THIS buffer + if found on PATH
:Inspect              " treesitter/syntax highlight groups under cursor
:Mason                " is the binary installed? (g? for help, i to install)
```

**Healthy state for a TS/JS file** = `:LspInfo` shows the TS server *and* `eslint`
attached, both with `Root directory` = your project root (not `~`). `:ConformInfo`
shows `prettierd`/`prettier`. Edit indentation, `:w`, watch it reflow.

### Per-layer troubleshooting

- **LSP didn't attach** → `:LspInfo` empty. Check (a) `:Mason` shows the server
  installed, (b) the project has a root marker the server recognizes
  (`package.json`, `.git`, `tsconfig.json`, `Gemfile`…), (c) `:LspLog` tail for the
  real error.
- **LSP attached but "Cannot find module 'react-native'"** → the project's deps
  aren't installed. Run the project's package install (`npm install`, `bundle
  install`) so `node_modules` / gems exist, then `:LspRestart`.
- **Wrong/global tool version** → conform prefers the project-local binary in
  `node_modules/.bin`; `prettierd` reads the project's prettier config + plugins.
  If it picks a global one, confirm the local install exists.
- **Format-on-save did nothing** → `:ConformInfo`. If the formatter shows but isn't
  "available", the binary is missing (`:Mason` install it). If the filetype isn't
  listed at all, add it to `formatters_by_ft` in `syntax.lua`.
- **No/odd highlighting** → `:Inspect`. Missing parser? `:TSInstall <lang>` or just
  reopen (auto-install). `:checkhealth nvim-treesitter` flags compiler issues.
- **No completion menu** → completion piggybacks on the LSP. If `:LspInfo` is
  empty, fix the LSP first; blink has nothing to show.

## What each tool does (one-liner each)

| Tool | Role |
| ---- | ---- |
| `vtsls` | TypeScript/JavaScript language server (types, nav, refactors, completion) |
| `eslint` (vscode-eslint LS) | Lint diagnostics; auto-detects flat config (`eslint.config.js`). **Not** a formatter here. |
| `tailwindcss` LS | Class completion + color swatches in `class`/`className` |
| `lua_ls` + `lazydev` | Lua LSP, aware of the Neovim API for editing this config |
| `ruby_lsp` / solargraph | Ruby LSP (currently commented out in `lsp.lua`) |
| `prettierd` / `prettier` | JS/TS/JSON/JSX/TSX formatting (conform runs it on save) |
| `stylua` | Lua formatting |
| `conform.nvim` | Decides which formatter to run per filetype; runs on save |
| `blink.cmp` | Completion UI; sources = lsp, path, snippets, buffer |
| `nvim-treesitter` | Parser-based highlight + indent + autotag (JSX/TSX/ERB) |
| `mason` | Installs the binaries the above need |

## TypeScript / React Native + Expo specifics

- No RN-specific language server exists — it's plain TS tooling. `vtsls` handles
  `.ts/.tsx/.js/.jsx`.
- **`npm install` first.** Without `node_modules`, `vtsls` can't resolve
  react-native/expo types and `eslint` can't load `eslint-config-expo`.
- Dev loop is external: `npx expo run:ios --device` + Metro hot-reload in a separate
  terminal. Neovim only edits + formats + lints; no build/run/DAP integration here.
- Filetype map: `.ts`→typescript, `.tsx`→typescriptreact, `.js`→javascript,
  `.jsx`→javascriptreact. All six (+ json/jsonc) format on save.
- JSX/TSX tags auto-close and auto-rename via nvim-ts-autotag.
