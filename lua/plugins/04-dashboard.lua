return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":e <BAR> startinsert <CR>"),
      dashboard.button("o", "  Open current dir", ":e . <CR>"),
      dashboard.button("f", "  Find file", ":cd $HOME/Projects| Telescope find_files<CR>"),
      dashboard.button("s", "  Recent session", function() require("persistence").load({ last = true }) end),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("w", "  Wiki", ":VimwikiIndex<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    vim.api.nvim_create_autocmd("User", {
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        dashboard.section.footer.val = "󱐌 Lazy-loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
