-- Godot Engine integration
-- godotdev.nvim handles:
--   - GDScript LSP (connects to Godot Editor's TCP server on port 6005)
--   - Godot documentation lookup inside Neovim
--   - Scene tree inspection
--   - :checkhealth godotdev for troubleshooting
--
-- REQUIRED in Godot Editor:
--   Editor > Editor Settings > Network > Language Server:
--     Port = 6005, Use Thread = true
--
--   Editor > Editor Settings > Text Editor > External:
--     Use External Editor = true
--     Exec Path = C:\Users\<you>\scoop\apps\neovim\current\bin\nvim.exe
--     Exec Flags = --server 127.0.0.1:55432 --remote-send "<C-\><C-N>:n {file}<CR>:call cursor({line},{col})<CR>"

return {
  {
    "Mathijs-Bakker/godotdev.nvim",
    ft = { "gdscript", "gdshader" },
    config = function()
      require("godotdev").setup({
        -- Port the Godot Editor's GDScript LSP listens on
        -- Must match: Editor Settings > Network > Language Server > Port
        lsp = {
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
          root_dir = function(fname)
            return vim.fs.dirname(
              vim.fs.find({ "project.godot", ".git" }, { upward = true, path = fname })[1]
            )
          end,
        },
      })
    end,
  },
}
