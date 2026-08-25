-- Custom Godot C# snippets via LuaSnip.
-- LazyVim's coding.luasnip extra (imported in lazy.lua) handles all the
-- blink.cmp <-> LuaSnip wiring. We just add our snippets here.


-- Boost snippet priority so they rank above LSP completions in the popup
return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = {
            score_offset = 100, -- push snippets to the top of the list
          },
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      -- Run LazyVim's default LuaSnip setup first
      if opts then
        require("luasnip").setup(opts)
      end

      -- Load community snippets (friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- ─── Godot C# Snippets ───────────────────────────────────────────
      local ls = require("luasnip")
      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      ls.add_snippets("cs", {

        -- gnode: full Godot Node class boilerplate
        s("gnode", fmt(
          [[
using Godot;
using System;

public partial class {} : {}
{{
    public override void _Ready()
    {{
        {}
    }}

    public override void _Process(double delta)
    {{
    }}
}}
          ]],
          { i(1, "ClassName"), i(2, "Node"), i(0) }
        )),

        -- gsig: declare a Godot signal
        s("gsig", fmt(
          [[
[Signal]
public delegate void {}EventHandler({});
          ]],
          { i(1, "MySignal"), i(2, "") }
        )),

        -- gexport: export a property to the Godot Inspector
        s("gexport", fmt(
          [[
[Export]
public {} {} {{ get; set; }}
          ]],
          { i(1, "float"), i(2, "Speed") }
        )),

      })
    end,
  },
}
