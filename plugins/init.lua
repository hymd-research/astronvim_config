return {
  {
    "andymass/vim-matchup"
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    "ray-x/cmp-treesitter",
    config = function()
      astronvim.add_user_cmp_source "treesitter"
    end
  },
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup()
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        bind = true,
      })
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "user.plugins.rust-tools"
    end
  }
}
