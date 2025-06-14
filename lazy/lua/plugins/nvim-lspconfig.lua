return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = { eslint = {} },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      clangd = function(_, opts)
        local clangd_arguments = {
          "--log=verbose",
          "--pretty",
          "--enable-config",
        }
        vim.list_extend(opts.cmd, clangd_arguments)
      end,
    },
  },
}
