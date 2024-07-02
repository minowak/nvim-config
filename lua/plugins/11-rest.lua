return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>",      desc = "Rest run" },
      { "<leader>rl", "<cmd>Rest run last<cr>", desc = "Rest run last" },
      {
        "<leader>re",
        function()
          require("telescope").extensions.rest.select_env()
        end,
        desc = "Rest select env"
      },
    },
    config = function()
      require("rest-nvim").setup({
        client = "curl",
        result = {
          split = {
            stay_in_current_window_after_split = true,
          },
          behavior = {
            show_info = {
              headers = true,
              curl_command = true
            }
          }
        }
      })
      require("telescope").load_extension("rest")
    end,
  }
}
