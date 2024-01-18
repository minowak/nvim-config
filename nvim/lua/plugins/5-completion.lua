return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      {
        "Exafunction/codeium.vim",
        event = 'BufEnter',
        cmd = "Codeium",
        build = ":Codeium Auth",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "hrsh7th/nvim-cmp",
        },
        config = function()
          vim.keymap.set("i", "<Tab>", function()
            return vim.fn["codeium#Accept"]()
          end, { expr = true })
          vim.keymap.set("i", "<C-j>", function()
            return vim.fn["codeium#CycleCompletions"](1)
          end, { expr = true })
          vim.keymap.set("i", "<C-k>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
          end, { expr = true })
          vim.keymap.set("i", "<C-x>", function()
            return vim.fn["codeium#Clear"]()
          end, { expr = true })
        end,
      },
      {
        "tzachar/cmp-tabnine",
        build = {
          ":CmpTabnineHub",
        },
        dependencies = "hrsh7th/nvim-cmp",
        opts = {
          max_lines = 1000,
          max_num_results = 3,
          sort = true,
        },
        config = function(_, opts)
          require("cmp_tabnine.config"):setup(opts)
        end,
      },
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "codeium",     group_index = 1, priority = 100 },
          { name = "cmp_tabnine", group_index = 1, priority = 100 },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = {
              Codeium = "",
              TabNine = "",
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "",
              Field = "󰜢",
              Variable = "󰀫",
              Class = "󰠱",
              Interface = "",
              Module = "",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "󰈇",
              Folder = "󰉋",
              EnumMember = "",
              Constant = "󰏿",
              Struct = "󰙅",
              Event = "",
              Operator = "󰆕",
              TypeParameter = "",
            },
          }),
        },
      })
    end,
    -- opts = function(_, opts)
    --   local format_kinds = opts.formatting.format
    --   opts.formatting.format = function(entry, item)
    --     format_kinds(entry, item) -- add icons
    --     return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    --   end
    -- end,
  },
  {
    "tzachar/cmp-tabnine",
    build = {
      ":CmpTabnineHub",
    },
    dependencies = "hrsh7th/nvim-cmp",
    opts = {
      max_lines = 1000,
      max_num_results = 3,
      sort = true,
    },
    config = function(_, opts)
      require("cmp_tabnine.config"):setup(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
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
      },
    },
    main = "ibl",
  },
}
