-- C# / Roslyn LSP configuration
-- Uses the official Microsoft Roslyn language server (same engine as VS / VS Code)
-- Roslyn is NOT in the default Mason registry — Crashdummyy's registry is required.

return {
  -- Add Crashdummyy's mason registry so :MasonInstall roslyn works
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },

  -- Official Roslyn LSP plugin
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = {
      "tris203/rzls.nvim", -- Razor/cshtml LSP (optional but useful for .cshtml)
    },
    opts = {
      config = {
        -- Roslyn LSP settings passed directly to the server
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      },
    },
  },

  -- nvim-dap: Debug Adapter Protocol client (for breakpoints, stepping, etc.)
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },

  -- netcoredbg DAP adapter for .NET (install via :MasonInstall netcoredbg)
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = {
      ensure_installed = { "coreclr" },
    },
  },
}
