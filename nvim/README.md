# Georgi's Neovim Config

A Lua-based Neovim setup built on `lazy.nvim`, tuned for Ruby/Rails, Tailwind, and general full-stack work. Gruvbox light, leader `,`, super-tab completion.

## Layout

```
init.lua                  Entry point. Bootstraps lazy.nvim and loads user/*.
lua/user/                 Pure-vim config (no plugins).
  editor.lua              Editor options: numbers, indent, clipboard, undo, etc.
  keymappings.lua         Leader, window nav, jj→Esc, edit-config shortcut.
lua/plugins/              Plugin specs grouped by purpose. Auto-loaded.
  completion.lua          blink.cmp
  default.lua             Zen mode
  fun.lua                 Usage tracker
  git.lua                 Gitsigns, blame, gitportal
  llm.lua                 (Empty — LLM plugins commented out)
  lsp.lua                 LSP servers, Mason, on-attach keymaps
  navigation.lua          Telescope, neo-tree, tabby, easymotion
  ruby.lua                vim-rails, vim-test, vim-slime, endwise
  syntax.lua              Treesitter, conform (formatter), autopairs
  tailwind.lua            tailwind-tools, nvim-highlight-colors
  theme.lua               Gruvbox + lualine
  util.lua                Sleuth, surround, mini.nvim, easy-align, cheatsheet
lazy-lock.json            Pinned plugin versions
cheatsheet.txt            Scratch notes
AGENTS.md                 Reference for LLM agents editing this config
```

## Plugins

### Editor core
- **lazy.nvim** — plugin manager
- **vim-sleuth** — auto-detect indent settings per file
- **vim-surround** / **vim-repeat** — surround text objects
- **mini.ai** — better around/inside text objects (`va)`, `yinq`, `ci'`)
- **mini.trailspace** — strips trailing whitespace on save (except markdown)
- **auto-pairs** + **nvim-autopairs** — bracket pairing
- **vim-easy-align** — alignment by separator

### Navigation
- **telescope.nvim** — fuzzy finder (files, grep, LSP, etc.)
- **neo-tree.nvim** — file tree
- **tabby.nvim** — custom tabline
- **vim-easymotion** — jump-to-character motion

### LSP / Completion / Formatting
- **nvim-lspconfig** + **mason.nvim** + **mason-lspconfig** + **mason-tool-installer**
- **blink.cmp** — completion engine (super-tab preset)
- **conform.nvim** — formatter dispatcher, runs on save
- **fidget.nvim** — LSP progress UI
- **lazydev.nvim** — Lua LSP setup for nvim config

### Syntax / Treesitter
- **nvim-treesitter** + **nvim-ts-autotag** + **nvim-treesitter-endwise**
- **render-markdown.nvim** — pretty markdown rendering
- **vim-coffee-script**, **vim-slim**, **yaml.nvim**

### Git
- **gitsigns.nvim** — gutter signs + hunks
- **blame.nvim** — line blame window
- **gitportal.nvim** — share links to git lines

### Ruby/Rails
- **vim-ruby**, **vim-rails**, **vim-endwise** (tpope), **nvim-treesitter-endwise**
- **vim-test** + **vimux** — run tests in tmux
- **vim-slime** — send text to tmux pane (REPL)

### Tailwind / CSS
- **tailwind-tools.nvim** — color swatches, class sorting, conceal
- **nvim-highlight-colors** — inline color preview for hex/rgb/tailwind

### UI / Theme
- **gruvbox** (light, medium contrast, no italics)
- **lualine.nvim** — statusline
- **nvim-web-devicons**
- **zen-mode.nvim**
- **todo-comments.nvim** — highlight TODO/FIXME

### Misc
- **cheatsheet.nvim** — searchable cheatsheet
- **usage-tracker.nvim** — local usage stats

## Keybindings

Leader is **`,`**.

### Files & search (Telescope)

| Key            | Action                                       |
| -------------- | -------------------------------------------- |
| `<leader>f`    | Find files                                   |
| `<leader>sg`   | Live grep                                    |
| `<leader>sw`   | Grep word under cursor                       |
| `<leader>gw`   | Live grep prefilled with word under cursor   |
| `<leader>/`    | Fuzzy find in current buffer                 |
| `<leader>s/`   | Live grep in open files                      |
| `<leader>sh`   | Search help tags                             |
| `<leader>sk`   | Search keymaps                               |
| `<leader>sd`   | Search diagnostics                           |
| `<leader>sr`   | Resume last picker                           |
| `<leader>..`   | Recent files                                 |
| `<leader>sn`   | Search files inside nvim config              |

### LSP (active when LSP attached)

| Key            | Action                          |
| -------------- | ------------------------------- |
| `K`            | Hover docs                      |
| `grd`          | Go to definition (Telescope)    |
| `grD`          | Go to declaration               |
| `gri`          | Go to implementation            |
| `grr`          | References                      |
| `grt`          | Type definition                 |
| `grn`          | Rename                          |
| `gra`          | Code action                     |
| `gO` / `gW`    | Document / workspace symbols    |
| `<leader>gd`   | Definition (raw LSP)            |
| `<leader>gr`   | References (raw LSP)            |
| `<leader>gf`   | Format buffer                   |
| `<leader>ca`   | Code action                     |
| `<leader>rn`   | Rename                          |
| `<leader>th`   | Toggle inlay hints              |
| `<leader>a`    | Format buffer (via conform)     |

### Windows / tabs

| Key                  | Action                          |
| -------------------- | ------------------------------- |
| `<C-h/l>`            | Move focus left/right window    |
| `<C-j>` / `<C-k>`    | Move current line down/up       |
| `<leader>t`          | New tab                         |
| `<leader>x`          | Close tab                       |
| `<leader>to`         | Close other tabs                |
| `<Tab>` / `<S-Tab>`  | Next / prev tab                 |
| `<leader>tmp/tmn`    | Move tab left / right           |
| `<leader><Tab>`      | Jump-to-tab mode                |

### File tree
| Key            | Action                  |
| -------------- | ----------------------- |
| `<leader>.`    | Reveal current file in neo-tree |

### EasyMotion
| Key                  | Action                       |
| -------------------- | ---------------------------- |
| `<Space>`            | 2-character jump             |
| `<leader><Space>`    | Operator-line select         |
| `<leader>j/k`        | Jump to visible line down/up |
| `d<leader><Space>`   | Delete line via easyop       |

### Git
| Key            | Action                  |
| -------------- | ----------------------- |
| `<leader>b`    | Toggle blame window     |

### Ruby / Tests / REPL
| Key            | Action                            |
| -------------- | --------------------------------- |
| `<leader>tt`   | Run tests in file (vim-test)      |
| `<leader>ts`   | Run nearest test (vim-test)       |
| `<leader>r`    | Slime: send line to tmux          |
| `<leader>e`    | Slime: send region to tmux        |

### Tailwind
| Key            | Action                  |
| -------------- | ----------------------- |
| `<leader>tc`   | Toggle class conceal    |

(`:TailwindSort` is still available as an ex command — needs `rustywind` on PATH.)

### Completion (blink.cmp, insert mode)
| Key            | Action                  |
| -------------- | ----------------------- |
| `<Tab>`        | Accept / next item      |
| `<C-j>/<C-k>`  | Next / prev item        |
| `<C-Space>`    | Open menu / open docs   |
| `<C-?>`        | Show documentation      |
| `<C-e>`        | Hide menu               |

### Misc
| Key            | Action                          |
| -------------- | ------------------------------- |
| `,`            | Leader                          |
| `jj`           | Escape (insert mode)            |
| `0`            | Jump to first non-blank char    |
| `<Esc>`        | Clear search highlight          |
| `<leader>q`    | Clear search highlight          |
| `<leader>ev`   | Edit `$MYVIMRC`                 |
| `<leader>h`    | Open cheatsheet                 |
| `<leader>zm`   | Zen mode                        |
| `ga` (n/v)     | Easy align                      |
| `:W`           | Alias for `:w`                  |

## Common operations

- **Install/update plugins**: `:Lazy sync`
- **Install LSP server**: add to `servers` table in `lua/plugins/lsp.lua`, then `:Mason` or restart
- **Install treesitter parser**: add to `ensure_installed` in `lua/plugins/syntax.lua`, then `:TSUpdate`
- **Format buffer manually**: `<leader>a` or `<leader>gf`
- **Check LSP**: `:LspInfo`
- **Check Mason tools**: `:Mason`
- **Health check**: `:checkhealth`

## Notable defaults (`lua/user/editor.lua`)

- Numbers + relative numbers on
- 2-space indent, expandtab
- Clipboard tied to system clipboard
- Persistent undo
- Smart case search
- 5-line scroll padding
- Cursorline on
- 300ms timeout for which-key style maps
- Confirm before quitting modified buffers
- Splits open right / below
