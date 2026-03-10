return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "rust_analyzer", "zls", "gopls", "ts_ls",
        "pyright", "lua_ls", "docker_compose_language_service",
        "dockerls", "html", "cssls", "tailwindcss",
        "bashls", "yamlls", "sqls", "astro",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local function on_attach(_, bufnr)
        vim.api.nvim_create_user_command("ToggleInlineDiagnostics", function()
          local config = vim.diagnostic.config()
          vim.diagnostic.config({ virtual_text = not config.virtual_text })
        end, {})

        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr })
        vim.keymap.set("n", "<leader>lt", vim.cmd.ToggleInlineDiagnostics, { buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })

        vim.diagnostic.config({
          virtual_text = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "󰌶",
            }
          }
        })
      end

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          }
        }
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            semanticTokens = true,
            staticcheck = true,
            completeUnimported = true,
            gofumpt = true,
          }
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            on_attach(client, args.buf)
          end
        end,
      })
    end,
  },
}
