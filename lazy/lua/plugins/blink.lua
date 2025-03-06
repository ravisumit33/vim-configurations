return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap["<CR>"] = {} -- Remove the original <CR> mapping
      opts.keymap["<S-CR>"] = { "accept", "fallback" }
      return opts
    end,
  },
}
