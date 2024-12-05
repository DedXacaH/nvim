local on_attach = require("configs/lspconf").on_attach
local capagilities = require("configs/lspconf").capagilities

local lspconfig = require "lspconfig"
local servers = { "html", "clangd", "phpactor", "ts_ls", "lua_ls", "twiggy_language_server" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = function(client, bufnr)
      -- Call the original NvChad on_attach function
      on_attach(client, bufnr)

      local map = vim.keymap.set
      -- LSP
      -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
      map("n", "gD", function()
        vim.lsp.buf.declaration()
      end, { desc = "LSP declaration" })
      map("n", "gd", function()
        vim.lsp.buf.definition()
      end, { desc = "LSP definition" })
      map("n", "gi", function()
        vim.lsp.buf.implementation()
      end, { desc = "LSP implementation" })
      map("n", "gr", function()
        vim.lsp.buf.references(nil, { loclist = true })
      end, { desc = "LSP references" })
      map("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "LSP hover" })
      map("n", "<leader>sh", function()
        vim.lsp.buf.signature_help()
      end, { desc = "LSP signature help" })
      map("n", "<leader>D", function()
        vim.lsp.buf.type_definition()
      end, { desc = "LSP type definition" })
      map("n", "<leader>rr", function()
        vim.lsp.buf.rename()
      end, { desc = "LSP rename" })
      map("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "LSP code action" })
      map("n", "<leader>f", function()
        vim.lsp.buf.open_float() { border = "rounded" }
      end, { desc = "LSP floating diagnostic" })
      map("n", "[d", function()
        vim.lsp.buf.goto_prev() { float = { border = "rounded" } }
      end, { desc = "LSP go to prev" })
      map("n", "]d", function()
        vim.lsp.buf.goto_next() { float = { border = "rounded" } }
      end, { desc = "LSP go to next" })
      map("n", "<leader>q", function()
        vim.lsp.buf.setloclist()
      end, { desc = "LSP diagnostic setloclist" })
      map("n", "<leader>wa", function()
        vim.lsp.buf.add_workspace_folder()
      end, { desc = "LSP add workspace folder" })
      map("n", "<leader>wr", function()
        vim.lsp.buf.remove_workspace_folder()
      end, { desc = "LSP remove workspace folder" })
      map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "LSP list workspace folder" })
      map("v", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "LSP code action" })
    end,
    capabilities = capabilities,
	}
end

lspconfig.twiggy_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    twiggy = {
      -- before 0.8.0:
      -- phpBinConsoleCommand = 'php bin/console',
      framework = "symfony",
      phpExecutable = "/usr/bin/php",
      symfonyConsolePath = "bin/console",
    },
  },
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
