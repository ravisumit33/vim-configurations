return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters.prettier = {
        condition = function(_, ctx)
          local cwd = vim.fn.getcwd()
          if cwd:match("AcroJS") then
            return false
          end
          return true
        end,
      }
    end,
  },
}
