# dotfiles

This repository contains some of my dotfiles. It is a living repository and will be updated as my needs/preferences change.

This repository primarily mirrors my `.config/` directory. The sub-directories that are not present in the `.config/` directory are:

- `tmux/`
- `vim/`
- `zsh/`

# Repository Tree

```
dotfiles/
├── alacritty
│   └── alacritty.yml
├── fish
│   └── config.fish
├── leftwm
│   └── config.toml
├── nvim
│   ├── init.lua
│   └── lua
│       ├── config
│       │   ├── diagnostics.lua
│       │   ├── keybindings.lua
│       │   ├── lazy.lua
│       │   └── vimcommands.lua
│       └── plugins
│           ├── coding
│           │   ├── blink.lua
│           │   ├── copilot.lua
│           │   ├── nvim-dap.lua
│           │   ├── nvim-lint.lua
│           │   ├── nvim-lspconfig.lua
│           │   ├── nvim-treesitter.lua
│           │   ├── vim-fugitive.lua
│           │   └── vim-gitgutter.lua
│           ├── formatting
│           │   ├── conform.lua
│           │   ├── indent-blankline.lua
│           │   ├── nerdcommenter.lua
│           │   ├── nvim-colorizer.lua
│           │   ├── peek.lua
│           │   └── vim-surround.lua
│           ├── init.lua
│           ├── productivity
│           │   └── obsidian.lua
│           ├── themes
│           │   ├── gruvbox.lua
│           │   ├── kanagawa.lua
│           │   └── nord.lua
│           └── ui
│               ├── lualine.lua
│               ├── nvim-tree.lua
│               ├── telescope.lua
│               ├── twilight.lua
│               └── zen-mode.lua
├── tmux
│   └── .tmux.conf
├── vim
│   └── .vimrc
└── zsh
    └── .zshrc
```

# Links

- [Alacritty][Alacritty]
- [Fish][Fish]
- [LeftWM][LeftWM]
- [Neovim][Neovim]
- [Tmux][Tmux]
- [Vim][Vim]

<!-- LINKS -->

[Alacritty]: https://github.com/alacritty/alacritty
[Fish]: https://fishshell.com/
[LeftWM]: https://github.com/leftwm/leftwm
[Neovim]: https://neovim.io/
[Tmux]: https://github.com/tmux/tmux
[Vim]: https://www.vim.org/
