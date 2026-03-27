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
        "bashls", "yamlls", "sqls", "astro", "lwc_ls", "eslint",
      },
      automatic_enable = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        float = {
          border = "rounded",
          source = true,
        },
      })

      local _virtual_text_enabled = true
      vim.api.nvim_create_user_command("ToggleInlineDiagnostics", function()
        _virtual_text_enabled = not _virtual_text_enabled
        vim.diagnostic.config({ virtual_text = _virtual_text_enabled })
      end, { force = true })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false
            },
            telemetry = { enable = false },
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
            analyses = {
              unusedparams = true,
              shadow = true,
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end

          map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>lf", vim.lsp.buf.format, "Format buffer")
          map("<leader>ld", vim.diagnostic.open_float, "Open diagnostic float")
          map("<leader>lt", vim.cmd.ToggleInlineDiagnostics, "Toggle inline diagnostics")
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "Go to references")

          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>la", vim.lsp.buf.code_action, "Code actions")
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
        end,
      })
    end
  },
}
