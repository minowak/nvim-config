-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("snippets.react")

vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("dracula")
vim.diagnostic.config({ float = { border = "rounded" } })
