-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here

-- Explicit filetype detection for Godot project files.
-- This ensures filetypes are set correctly even for brand-new files
-- that don't exist on disk yet (e.g. when you do :e NewScript.cs).
vim.filetype.add({
  extension = {
    cs       = "cs",        -- C# files
    gd       = "gdscript",  -- GDScript files
    gdshader = "gdshader",  -- Godot shader files
    tres     = "gdresource", -- Godot text resource files
    tscn     = "gdresource", -- Godot scene files
  },
})
