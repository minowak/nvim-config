return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua" } },
    opts = {
      highlight = { timer = 250 },
      ring = { storage = "sqlite" },
    },
    keys = {
      -- stylua: ignore
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
      { "y",         "<Plug>(YankyYank)",                                                          mode = { "n", "x" },                           desc = "Yank text" },
      { "p",         "<Plug>(YankyPutAfter)",                                                      mode = { "n", "x" },                           desc = "Put yanked text after cursor" },
      { "P",         "<Plug>(YankyPutBefore)",                                                     mode = { "n", "x" },                           desc = "Put yanked text before cursor" },
      { "gp",        "<Plug>(YankyGPutAfter)",                                                     mode = { "n", "x" },                           desc = "Put yanked text after selection" },
      { "gP",        "<Plug>(YankyGPutBefore)",                                                    mode = { "n", "x" },                           desc = "Put yanked text before selection" },
      { "[y",        "<Plug>(YankyCycleForward)",                                                  desc = "Cycle forward through yank history" },
      { "]y",        "<Plug>(YankyCycleBackward)",                                                 desc = "Cycle backward through yank history" },
      { "]p",        "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[p",        "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { "]P",        "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[P",        "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { ">p",        "<Plug>(YankyPutIndentAfterShiftRight)",                                      desc = "Put and indent right" },
      { "<p",        "<Plug>(YankyPutIndentAfterShiftLeft)",                                       desc = "Put and indent left" },
      { ">P",        "<Plug>(YankyPutIndentBeforeShiftRight)",                                     desc = "Put before and indent right" },
      { "<P",        "<Plug>(YankyPutIndentBeforeShiftLeft)",                                      desc = "Put before and indent left" },
      { "=p",        "<Plug>(YankyPutAfterFilter)",                                                desc = "Put after applying a filter" },
      { "=P",        "<Plug>(YankyPutBeforeFilter)",                                               desc = "Put before applying a filter" },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",            -- Add surrounding in Normal and Visual modes
        delete = "gsd",         -- Delete surrounding
        find = "gsf",           -- Find surrounding (to the right)
        find_left = "gsF",      -- Find surrounding (to the left)
        highlight = "gsh",      -- Highlight surrounding
        replace = "gsr",        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  {
    "anuvyklack/fold-preview.nvim",
    event = "BufReadPost",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = true,
  },
  {
    'vimwiki/vimwiki',
    event = "VeryLazy",
    init = function()
      vim.g.vimwiki_list = {
        {
          template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
          syntax = "markdown",
          ext = ".md",
          path = "~/personalwiki", -- does not work?=!?!?
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "airblade/vim-rooter"
  },
}
