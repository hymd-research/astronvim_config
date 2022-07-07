local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  astronvim.conditional_func(telescope.load_extension, pcall(require, "dap"), "dap")
  astronvim.conditional_func(telescope.load_extension, pcall(require, "neoclip"), "neoclip")
end

return {
  defaults = {
    prompt_prefix=' ',
  },
}
