# Dotfiles

A macOS development environment configuration built around Neovim.

- [Neovim](nvim/init.lua): editing, navigation, and language support
- [zsh](zsh/.zprofile): makes Homebrew programs available in login shells
- [Git](git/.gitconfig): commit identity, default branch, and editor

The programs configured here need to be installed separately.

## Neovim

Built-in LSP support for completion, diagnostics, and navigation.

| Plugin | Purpose |
| --- | --- |
| `mini.pick` | File, buffer, and text search |
| `mini.files` | Directory browsing and editing |
| `conjure` | REPL integration |
| `render-markdown.nvim` | Inline Markdown rendering |

File and text searches use Neovim's working directory.

Mappings use Normal mode unless noted. Leader and local leader: `Space`.

### File Navigation

| Keys | Action |
| --- | --- |
| `Space f f` | Find files by name |
| `Space f b` | Find open buffers |
| `Space f g` | Search text across files |
| `Space f e` | Explore directories |
| `Space g b` | Go back through jump history |

`mini.files`: `j`/`k` select, `h` parent, `l` open, `L` open file and close explorer, `q` close, `g?` help. Directory edits are applied with `=` after confirmation.

### Language Servers

Available when a language server is attached:

| Keys | Action |
| --- | --- |
| `Space c d` | Go to definition |
| `Space c h` | Hover documentation |
| `Space c e` | Line diagnostics |

LSP completion triggers while typing in Insert mode. Arrow keys select; `Tab` accepts the first or selected suggestion. `Enter` dismisses the menu and inserts a newline. With the menu closed, `Tab` indents normally.

### REPL

Conjure starts a REPL when opening a Racket file. For Clojure, it connects to a running project nREPL server through `.nrepl-port`.

| Keys | Action |
| --- | --- |
| `Space e e` | Evaluate the expression under the cursor |
| `Space e r` | Evaluate the outermost expression containing the cursor |
| `Space e f` | Evaluate the file from disk; save edits first |
| `Space E` in Visual mode | Evaluate the selected text |
| `Space l s`, `Space l q` | Open the evaluation log in a split, or close it |
| `Space K` | Look up documentation through Conjure |

## Plugin Updates

`vim.pack` manages plugins. Updates track the latest commit on each plugin's default branch, including changes between tagged releases. The [lockfile](nvim/nvim-pack-lock.json) records the installed revisions.

1. `:lua vim.pack.update()` — fetch and review updates.
2. `:write` — apply; `:quit` — cancel.
3. Restart Neovim.
4. Review and commit the lockfile changes.

Update Neovim and external tools through their respective installers.

After restoring an older lockfile, restart Neovim and run `:lua vim.pack.update(nil, { target = 'lockfile' })` to synchronize installed plugins. Review and apply, then restart again.
