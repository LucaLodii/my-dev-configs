-- Luca Lodi - mechi aqui também, Gemini me ajudou com os comentarios 
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false, -- ADICIONADO: Garante que o plugin carregue imediatamente
    --build = ":TSUpdate", -- CORRETO: Manteve comentado, pois pode causar problemas no Windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      -- ADICIONADO: Garante que o plugin de contexto de comentário seja instalado
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "cpp",
          "c",
          "go",
          "rust",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
      require("ts_context_commentstring").setup({})

      -- --- [NOVA ADIÇÃO] ---
      -- Forçar a instalação dos parsers APÓS o Treesitter ter sido configurado.
      -- Isso garante que os comandos :TSInstall estejam disponíveis e que o parser 'lua' seja instalado.
      -- Ele verifica se o parser já está lá antes de tentar instalar para evitar trabalho duplicado.
      local has_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
      if has_ts and ts_configs.has_installed then
          -- Verificar se o parser 'lua' está instalado, se não, tentar instalar
          if not ts_configs.has_installed("lua") then
              vim.cmd("TSInstallSync lua")
          end
      end
      -- --- [FIM DA NOVA ADIÇÃO] ---
    end,
  },
}