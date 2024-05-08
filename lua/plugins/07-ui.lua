return {
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      vim.notify = require("notify")
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
      { "<leader>bs", "<Cmd>BufferLinePick<CR>",                 desc = "Select buffer" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          -- stylua: ignore
          close_command = function(n) require("mini.bufremove").delete(n, false) end,
          -- stylua: ignore
          right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          auto_toggle_bufferline = true,
          separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left",
            },
          },
          custom_filter = function(buf_number, buf_numbers)
            if vim.bo[buf_number].filetype ~= "httpResult" then
              return true
            end
          end,
          groups = {
            items = {
              require('bufferline.groups').builtin.pinned:with({
                icon = "",
                highlight = { fg = "green" },
              })
            }
          }
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<S-Enter>",
        function() require("noice").redirect(vim.fn.getcmdline()) end,
        mode = "c",
        desc =
        "Redirect Cmdline"
      },
      {
        "<leader>snl",
        function() require("noice").cmd("last") end,
        desc =
        "Noice Last Message"
      },
      {
        "<leader>snh",
        function() require("noice").cmd("history") end,
        desc =
        "Noice History"
      },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      {
        "<leader>snd",
        function() require("noice").cmd("dismiss") end,
        desc =
        "Dismiss All"
      },
      {
        "<c-f>",
        function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
        silent = true,
        expr = true,
        desc =
        "Scroll forward",
        mode = {
          "i", "n", "s" }
      },
      {
        "<c-b>",
        function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
        silent = true,
        expr = true,
        desc =
        "Scroll backward",
        mode = {
          "i", "n", "s" }
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      local devicons = require('nvim-web-devicons')
      devicons.setup({
        override = {
          http = {
            icon = "",
            color = "#428890",
            cterm_color = "65",
            name = "HTTP"
          }
        }
      })
    end
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end
  }
}
