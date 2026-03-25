# dotfiles

My personal config files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package    | Config                          | Notes                                                    |
| ---------- | ------------------------------- | -------------------------------------------------------- |
| `tmux`     | `~/.tmux.conf`                  | Ctrl+A prefix, vi copy-mode, Tokyonight theme            |
| `kitty`    | `~/.config/kitty/kitty.conf`    | Abernathy theme, JetBrains Mono, tmux-style keybinds     |
| `ghostty`  | `~/.config/ghostty/config`      | Abernathy theme, matching Kitty setup                    |
| `nvim`     | `~/.config/nvim/`               | Modular Kickstart config for full-stack web dev           |
| `zed`      | `~/.config/zed/`                | Vim mode, keymaps mirroring nvim                         |
| `lazygit`  | `~/.config/lazygit/config.yml`  | Pull/push confirmation prompts                           |
| `zsh`      | `~/.zshrc`                      | oh-my-zsh, vi mode, pomodoro timer, custom prompt        |
| `git`      | `~/.gitconfig`                  | User config                                              |

## Setup

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/)
- [oh-my-zsh](https://ohmyz.sh/) with `zsh-autosuggestions` and `zsh-syntax-highlighting`

### Install

```bash
# Install stow
sudo apt install stow

# Clone the repo
git clone git@github.com:ajay-v11/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Symlink everything
stow tmux zsh git kitty ghostty nvim zed lazygit

# Or just specific packages
stow tmux nvim
```

> **If configs already exist**, use `--adopt` to move them into the repo and replace with symlinks:
>
> ```bash
> stow --adopt tmux zsh git kitty ghostty nvim zed lazygit
> ```
>
> Then run `git diff` to check nothing changed unexpectedly.

### Uninstall

```bash
# Remove symlinks for a package
stow -D tmux

# Remove all
stow -D tmux zsh git kitty ghostty nvim zed lazygit
```

## How it works

Each folder is a "stow package" that mirrors your home directory structure:

```
dotfiles/
├── tmux/
│   └── .tmux.conf              → ~/.tmux.conf
├── kitty/
│   └── .config/kitty/
│       └── kitty.conf          → ~/.config/kitty/kitty.conf
├── nvim/
│   └── .config/nvim/
│       ├── init.lua            → ~/.config/nvim/init.lua
│       └── lua/...             → ~/.config/nvim/lua/...
└── ...
```

Running `stow <package>` from inside `~/dotfiles` creates symlinks in `~` pointing back to the repo. Edit the files anywhere — they're the same file.
