return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          })
        }
      })
      vim.keymap.set("n", "<leader>tR", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run tests (file)" })
      vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end, { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Tests summary" })
      vim.keymap.set("n", "<leader>to", function() neotest.output.open() end, { desc = "Test output" })
    end
  }
}
