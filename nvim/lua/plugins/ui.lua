return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background", -- Рендер цветов в виде фона, 'foreground' - для текста
        enable_named_colors = true, -- Поддержка именованных цветов
        enable_tailwind = true, -- Поддержка цветов tailwind
      })
    end,
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function(_, opts)
  --     local logo = [[
  -- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
  -- ████╗  ██║██║   ██║██║████╗ ████║
  -- ██╔██╗ ██║██║   ██║██║██╔████╔██║
  -- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
  -- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
  -- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
  --     ]]
  --
  --     logo = string.rep("\n", 8) .. logo .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
}
