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

## Prerequisites

Before using these configurations, make sure you have the following installed:

1.  **Git:** For cloning the repository.
2.  **Neovim:** (Latest stable version). On Windows, I recommend using a package manager like Chocolatey: `choco install neovim`.
3.  **A Nerd Font:** Required for icons and glyphs in Neovim themes and plugins. I use [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads).
4.  **Node.js & npm:** Essencial para Language Servers, formatadores e linters de JavaScript/TypeScript. Verifique com `node -v` e `npm -v`.
5.  **Python:** Necessário para Language Servers e formatadores Python. Verifique com `python --version` (ou `py --version`).
6.  **MSYS2:** Fornece `make` e o toolchain MinGW-w64 (GCC 64-bit), essenciais para compilar plugins nativos do Neovim. Verifique com `gcc -v` no PowerShell (após adicionar ao PATH).
7.  **CMake:** Sistema de build utilizado por alguns plugins do Neovim (ex: `telescope-fzf-native.nvim`). Verifique com `cmake --version`.
