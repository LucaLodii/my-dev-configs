# My Development Configurations

A personal collection of my configuration files (`dotfiles`) to ensure a consistent and productive development environment on a new machine.

## My Environment

These configurations are tailored for and tested on the following setup:

* **OS:** Windows 11
* **Editors:** Neovim & VS Code
* **Browser:** Opera

## Contained Configurations

* **Neovim** (`nvim/`): A modern, Lua-based setup focused on web and systems development.
* **VS Code** (`vscode/`): Core `settings.json` to sync essential editor behavior and appearance.

## Required Software (Prerequisites)

This is the list of software you need to install on a new machine to make these configurations work.

1.  **Git:** For cloning the repository.
2.  **Neovim:** The latest stable version.
3.  **A Nerd Font:** Required for icons and glyphs in themes and plugins. I use [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads).
4.  **Node.js & npm:** Essential for JavaScript/TypeScript Language Servers, linters, and formatters.
5.  **Python:** Required for Python-based Language Servers and tools.
6.  **MSYS2:** Provides the MinGW-w64 toolchain (`make`, `gcc`), which is needed to compile some native Neovim plugins.
7.  **CMake:** A build system used by some native plugins (e.g., `telescope-fzf-native`).
