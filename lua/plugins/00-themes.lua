return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight-storm"
    end
  },
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  { 'dracula/vim',           name = 'dracula' },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
}
