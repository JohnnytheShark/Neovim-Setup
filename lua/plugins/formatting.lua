-- Formatting configuration via conform.nvim
-- Formatters used:
--   csharpier  — C# opinionated formatter (install via :MasonInstall csharpier)
--   gdformat   — GDScript formatter (install via: pip install gdtoolkit)
--
-- Format on save is enabled by default in LazyVim (<leader>cf to toggle).
-- Manual format: <leader>cf in normal mode.

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
        gdscript = { "gdformat" },
      },
      -- Format on save (comment out if you prefer manual formatting)
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },
}
