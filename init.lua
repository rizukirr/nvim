require("config.lazy")
require("config.option")
require("config.keymap")
require("config.autocmd")

-- Transparent Background
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
