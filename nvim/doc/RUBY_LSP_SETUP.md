# Ruby LSP setup (per project)

How to get Ruby completion, hover, signatures, and go-to-definition working in a
project. The Neovim side is already wired up in `lua/plugins/lsp.lua` — these
steps cover the per-machine gem install and per-project bootstrap.

## How it works here

- Ruby LSP is **not** managed by Mason. This machine uses a different Ruby per
  project (via **mise**), and a Mason binary would be pinned to one version.
- `lsp.lua` registers and enables `ruby_lsp` directly (`vim.lsp.enable`). It runs
  the `ruby-lsp` command, which resolves through mise's **shim** to the Ruby that
  belongs to the directory you're editing.
- On first launch in a project, ruby-lsp creates its own bundle in `.ruby-lsp/`
  (separate from your app's `Gemfile`) and indexes the project + its gems. The
  first start is slow; later starts are fast.

## One-time, per Ruby version

Install the gem for **each** Ruby version you develop against, then reshim:

```sh
# For the version active in the current project:
mise exec -- gem install ruby-lsp
# Or pin a specific version:
mise exec ruby@3.4.2 -- gem install ruby-lsp

mise reshim   # creates ~/.local/share/mise/shims/ruby-lsp
```

Repeat for every Ruby version. One `ruby-lsp` shim then dispatches to the correct
interpreter based on the project directory.

> Do **not** add `ruby-lsp` to a project's `Gemfile`. It manages its own bundle.
> Add `.ruby-lsp/` to the project's `.gitignore` (or your global gitignore).

## Per new project

1. Make sure the project pins a Ruby mise can resolve (`.ruby-version`,
   `.tool-versions`, or `mise.toml`). Confirm: `mise current ruby` in the project.
2. If that Ruby version has never had ruby-lsp installed, do the one-time step
   above for it.
3. `bundle install` so the project's gems exist (ruby-lsp indexes them).
4. Open a `.rb` file in the project with Neovim. First launch indexes — wait for
   the fidget spinner (bottom-right) to finish.

## Verify

Inside Neovim, in a `.rb` file in the project:

```vim
:echo exepath('ruby-lsp')   " non-empty path = shim is found
:LspInfo                    " ruby_lsp attached, Root directory = the project
```

Then type `SomeModule.` and confirm methods complete, the doc panel auto-shows,
and `K` gives full hover.

## Troubleshooting

- **`:LspInfo` empty / no completion** → `:echo exepath('ruby-lsp')` is empty. The
  shim isn't on Neovim's PATH. Run `mise reshim`; make sure mise is active in the
  shell that launches `nvim` (shims dir on `PATH`). `:LspLog` shows the real error.
- **Wrong Ruby / "your Ruby version is X, bundle is Y"** → ruby-lsp ran under a
  different interpreter than the project's bundle. Confirm `mise current ruby` in
  the project, install ruby-lsp for that version, `mise reshim`, then `:LspRestart`.
- **Stale index after big changes** → delete `.ruby-lsp/` and `:LspRestart` to
  force a clean re-index.
- **`:LspRestart`** after installing gems or switching versions, instead of
  restarting Neovim.

## Expectations

Completion is solid for explicitly-defined methods, constants, and gem APIs that
ruby-lsp indexed. Methods created dynamically — `method_missing`, `define_method`,
most Rails "magic" (associations, scopes, dynamic finders) — usually won't appear.
That's a limitation of Ruby's dynamism, not a config gap.
