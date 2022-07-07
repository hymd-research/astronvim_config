return  {
  sources = {
    require("null-ls.builtins").formatting.rufo,
    require("null-ls.builtins").diagnostics.rubocop,
    require("null-ls.builtins").completion.spell,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end
}
