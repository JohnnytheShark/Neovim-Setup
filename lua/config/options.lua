-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Start an RPC server so Godot Editor can open files in this Neovim instance
-- at the correct line and column (configured in Godot's External Editor settings).
-- Usage: launch Neovim with: nvim --listen 127.0.0.1:55432
-- Or let this autocmd handle it at startup:
vim.fn.serverstart("127.0.0.1:55432")
