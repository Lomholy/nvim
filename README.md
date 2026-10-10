# nvim

My Neovim configuration. Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which installs itself and every plugin (pinned in `lazy-lock.json`) on first launch.

## Install

```sh
# Back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/Lomholy/nvim ~/.config/nvim
nvim
```

## Requirements

Required:

- Neovim 0.12+
- `git`, `curl`, `tar`, and a C compiler with `make`

Optional (the config starts without them, but the matching feature is off):

| Tool | Used for |
| --- | --- |
| `tree-sitter` CLI (0.26.1+, not from npm) | Building Treesitter parsers for syntax highlighting |
| `ripgrep` | Telescope live grep (`<leader>fg`) |
| A [Nerd Font](https://www.nerdfonts.com) | Icons in lualine and nvim-tree |
| `node`/`npm` | Mason installing `eslint` |
| `python3` | Mason installing `ruff` |
| `mcstas-language-server` | McStas LSP (see [McStas](#mcstas)) |
| `prettier`, `isort`, `black` | Formatting with conform (`<leader>fo`) |
| `xclip` or `wl-clipboard` (Linux) | System clipboard |

### macOS

```sh
xcode-select --install
brew install neovim tree-sitter-cli ripgrep node python pipx
brew install --cask font-jetbrains-mono-nerd-font
```

### Debian/Ubuntu

The `neovim` package in apt is usually too old. Use the release tarball:

```sh
sudo apt install git curl tar build-essential ripgrep nodejs npm python3 pipx xclip
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

Get the `tree-sitter` CLI from its [releases page](https://github.com/tree-sitter/tree-sitter/releases), or run `cargo install --locked tree-sitter-cli`.

## McStas

`.instr` files open with the `mccode` syntax in `syntax/mccode.vim`. The McStas language server (hover and completion) starts when `mcstas-language-server` is on `PATH`. Install it from [VS_for_McStas](https://github.com/Lomholy/VS_for_McStas):

```sh
pipx install "git+https://github.com/Lomholy/VS_for_McStas#subdirectory=server/python"
```

To use a conda/mamba env instead, run `pip install` with the same URL inside that env, and activate the env before you start `nvim`.
