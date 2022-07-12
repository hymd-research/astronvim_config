astronvim.add_user_cmp_source "treesitter"

return {
  source_priority = {
    nvim_lsp = 1000,
    luasnip = 800,
    treesitter = 600,
    buffer = 400,
    path = 200,
  },
}
