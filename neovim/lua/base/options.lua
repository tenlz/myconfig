local options = {
  number = true,
  relativenumber = true,
  encoding = "utf-8",
  fileencoding = "utf-8",
  scrolloff = 5,
  sidescrolloff = 5,
  hlsearch = true,
  incsearch = true,
  mouse = "a",
  clipboard = "unnamedplus",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  ignorecase = true,
  smartcase = true,
  autoread = true,
  signcolumn = "yes",
  cursorline = true,
  wrap = false,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.scriptencoding = "utf-8"
vim.bo.autoread = true

