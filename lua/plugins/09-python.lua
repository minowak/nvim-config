return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    cmd = "VenvSelect",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "envs",
        },
        search_workspace = false,
        parents = 0,
        anaconda_envs_path = "/Users/minowak/miniforge3/envs",
      })
    end,
    keys = { { "<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
