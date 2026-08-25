-- Treesitter configuration
-- Extends LazyVim's default treesitter setup with Godot and C# parsers.
-- Treesitter provides: syntax highlighting, smart indentation, code navigation,
-- text objects (select inside a function, around a class, etc.)

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Godot
        "gdscript",        -- .gd files
        "godot_resource",  -- .tres / .res resource files
        "gdshader",        -- .gdshader / .shader files

        -- C# / .NET
        "c_sharp",         -- .cs files
        "xml",             -- .csproj, .sln, .props files

        -- Lua (Neovim config)
        "lua",
        "luadoc",

        -- General
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "json",
        "toml",
        "yaml",
        "regex",
        "bash",
      },
    },
  },
}
