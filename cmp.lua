astronvim.add_user_cmp_source "treesitter"

return {
  source_priority = {
    nvim_lsp = 1000,
    luasnip = 800,
    buffer = 600,
    path = 400,
    treesitter = 200,
  },
}
