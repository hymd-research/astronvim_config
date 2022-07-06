local config = {

  updater = {
    remote = "origin",
    channel = "nightly",
    version = "latest",
    branch = "main",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
  },

  colorscheme = "default_theme",

  options = {
    opt = {
      autoindent = true,
      completeopt = { "menu", "menuone", "noselect" },
      diffopt = { 'internal', 'filler', 'closeoff', 'vertical' },
      incsearch = true,
      relativenumber = true,
      shiftwidth = 4,
      tabstop = 4
    },
    g = {
      mapleader = " ",
    },
  },

  default_theme = {
    diagnostics_style = { italic = true },
  },

  plugins = {
    init = {
      { "andweeb/presence.nvim" },
      { "mrjones2014/legendary.nvim" },
      { "mfussenegger/nvim-dap" },
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
      { "andymass/vim-matchup" },
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
        "glepnir/lspsaga.nvim",
        config = function()
          require("lspsaga").init_lsp_saga()
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
        "nvim-telescope/telescope-dap.nvim",
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
        "simrat39/rust-tools.nvim",
        config = function()
          require("rust-tools").setup({
            tools = {
              executor = require("rust-tools.executors").termopen,
              hover_actions = {
                auto_focus = true,
                border = {
                  { "╭", "FloatBorder" },
                  { "─", "FloatBorder" },
                  { "╮", "FloatBorder" },
                  { "│", "FloatBorder" },
                  { "╯", "FloatBorder" },
                  { "─", "FloatBorder" },
                  { "╰", "FloatBorder" },
                  { "│", "FloatBorder" },
                },
              },
            },
            dap = {
              adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
              },
            },
          })
        end
      }
    },
    ["presence"] = {
      auto_update         = true,
      neovim_image_text   = "The One True Text Editor",
      main_image          = "neovim",
      client_id           = "793271441293967371",
      log_level           = nil,
      debounce_timeout    = 10,
      enable_line_number  = false,
      blacklist           = {},
      buttons             = true,
      file_assets         = {},

      editing_text        = "Editing %s",
      file_explorer_text  = "Browsing %s",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Reading %s",
      workspace_text      = "Working on %s",
      line_number_text    = "Line %s out of %s",
    },
    ["neo-tree"] = {
      close_if_last_window = false,
      window = {
        width = 34,
      }
    },
    ["null-ls"] = {
      sources = {
        require("null-ls.builtins").formatting.rufo,
        require("null-ls.builtins").diagnostics.rubocop,
        require("null-ls.builtins").completion.spell,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
    },
    ["cmp"] = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "path" },
      }
    },
    ["treesitter.configs"] = {
      matchup = {
        enable = true,
      }
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    ["treesitter"] = {
      ensure_installed = { "lua" },
    },
    ["packer"] = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
    ["telescope"] = {
      defaults = {
        prompt_prefix=' ',
      },
    },
  },

  luasnip = {
    vscode_snippet_paths = {},
  },

  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 800,
      treesitter = 600,
      buffer = 400,
      path = 200,
    },
  },

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  mappings = {
    n = {
      ["gh"] = {
        require("lspsaga.finder").lsp_finder,
        desc="Lspsaga lsp finder",
      },
      ["gs"] = {
        require("lspsaga.signaturehelp").signature_help,
        desc="Lspsaga signature help"
      },
      ["ca"] = {
        require("lspsaga.codeaction").code_action,
        desc="Lspsaga code action"
      },
      ["gk"] = {
        require("lspsaga.hover").render_hover_doc,
        desc="Lspsaga hover doc"
      },
    },
    v = {
      ["ca"] = {
        function()
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
          require("lspsaga.codeaction").range_code_action()
        end,
        desc="Lspsaga code action"
      }
    },
    t = {
    },
  },

  polish = function()
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })
  end,

}

return config

