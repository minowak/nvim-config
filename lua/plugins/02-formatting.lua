return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      local context = require("treesitter-context")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
      vim.keymap.set("n", "<leader>ut", function()
        context.toggle()
      end, { desc = "Toggle context" })
      vim.keymap.set("n", "[c", function()
        context.go_to_context(vim.v.count1)
      end, { silent = true, desc = "Go to context" })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          ["javascript"] = { "prettier" },
          ["javascriptreact"] = { "prettier" },
          ["typescript"] = { "prettier" },
          ["typescriptreact"] = { "prettier" },
          ["vue"] = { "prettier" },
          ["css"] = { "prettier" },
          ["scss"] = { "prettier" },
          ["less"] = { "prettier" },
          ["html"] = { "prettier" },
          ["json"] = { "prettier" },
          ["jsonc"] = { "prettier" },
          ["yaml"] = { "prettier" },
          ["markdown"] = { "prettier" },
          ["markdown.mdx"] = { "prettier" },
          ["graphql"] = { "prettier" },
          ["handlebars"] = { "prettier" },
          ["python"] = { "black" },
        },
        format_after_save = {
          async = true,
          -- timeout_ms = 1500,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  }
}
